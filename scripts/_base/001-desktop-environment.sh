#!/usr/bin/env bash

set -euox pipefail

excludes=(
    "@gnome-desktop"
)

# Make excludes a comma-separated string
excludes=$(IFS=, ; echo "${excludes[*]}")

# Install the base-graphical meta-package
dnf install -y @base-graphical @workstation-product-environment \
    --exclude "${excludes}"
