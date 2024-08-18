#!/usr/bin/env bash

set -euox pipefail

DESKTOP_ENVIRONMENT=""
FEDORA_VERSION=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --desktop)
      DESKTOP_ENVIRONMENT="$2"
      shift 2
      ;;
    --version)
      FEDORA_VERSION="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$DESKTOP_ENVIRONMENT" ]]; then
  echo "--desktop flag is required"
  exit 1
fi

if [[ -z "$FEDORA_VERSION" ]]; then
  echo "--version flag is required"
  exit 1
fi

# build list of all packages requested for inclusion
INCLUDED_PACKAGES=($(jq -r "[(.all.include | (.all, select(.\"$DESKTOP_ENVIRONMENT\" != null).\"$DESKTOP_ENVIRONMENT\")[]), \
                             (select(.\"$FEDORA_VERSION\" != null).\"$FEDORA_VERSION\".include | (.all, select(.\"$DESKTOP_ENVIRONMENT\" != null).\"$DESKTOP_ENVIRONMENT\")[])] \
                             | sort | unique[]" /tmp/packages.json))

# build list of all packages requested for exclusion
EXCLUDED_PACKAGES=($(jq -r "[(.all.exclude | (.all, select(.\"$DESKTOP_ENVIRONMENT\" != null).\"$DESKTOP_ENVIRONMENT\")[]), \
                             (select(.\"$FEDORA_VERSION\" != null).\"$FEDORA_VERSION\".exclude | (.all, select(.\"$DESKTOP_ENVIRONMENT\" != null).\"$DESKTOP_ENVIRONMENT\")[])] \
                             | sort | unique[]" /tmp/packages.json))


# ensure exclusion list only contains packages already present on image
if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    EXCLUDED_PACKAGES=($(rpm -qa --queryformat='%{NAME} ' ${EXCLUDED_PACKAGES[@]}))
fi

if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    dnf remove -y ${EXCLUDED_PACKAGES[@]}
fi

if [[ "${#INCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    dnf install -y ${INCLUDED_PACKAGES[@]}
fi

# check if any excluded packages are still present
# (this can happen if an included package pulls in a dependency)
EXCLUDED_PACKAGES=($(jq -r "[(.all.exclude | (.all, select(.\"$DESKTOP_ENVIRONMENT\" != null).\"$DESKTOP_ENVIRONMENT\")[]), \
                             (select(.\"$FEDORA_VERSION\" != null).\"$FEDORA_VERSION\".exclude | (.all, select(.\"$DESKTOP_ENVIRONMENT\" != null).\"$DESKTOP_ENVIRONMENT\")[])] \
                             | sort | unique[]" /tmp/packages.json))

if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    EXCLUDED_PACKAGES=($(rpm -qa --queryformat='%{NAME} ' ${EXCLUDED_PACKAGES[@]}))
fi

# remove any excluded packages which are still present on image
if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    dnf remove -y ${EXCLUDED_PACKAGES[@]}
fi
