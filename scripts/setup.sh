#!/usr/bin/env bash

set -euox pipefail

BASE=""
FEDORA_VERSION=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --base)
      BASE="$2"
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

if [[ -z "$BASE" ]]; then
  echo "--base flag is required"
  exit 1
fi

if [[ -z "$FEDORA_VERSION" ]]; then
  echo "--version flag is required"
  exit 1
fi

for script in /tmp/scripts/_base/*.sh; do
  if [[ -f "$script" ]]; then
    echo "Running $script"
    bash "$script" --version "$FEDORA_VERSION"
  fi
done

# If the image is BASE, then we don't need to run the same scripts again
if [[ "$BASE" == "base" ]]; then
  exit 0
fi

for script in /tmp/scripts/_$BASE/*.sh; do
  if [[ -f "$script" ]]; then
    echo "Running $script"
    bash "$script" --version "$FEDORA_VERSION"
  fi
done
