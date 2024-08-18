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

for script in /tmp/scripts/_base/*.sh; do
  if [[ -f "$script" ]]; then
    echo "Running $script"
    bash "$script" --version "$FEDORA_VERSION" --desktop $DESKTOP_ENVIRONMENT
  fi
done

# If the image is BASE, then we don't need to run the same scripts again
if [[ "$DESKTOP_ENVIRONMENT" == "base" ]]; then
  exit 0
fi

for script in /tmp/scripts/_$DESKTOP_ENVIRONMENT/*.sh; do
  if [[ -f "$script" ]]; then
    echo "Running $script"
    bash "$script" --version "$FEDORA_VERSION"
  fi
done
