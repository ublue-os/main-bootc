#!/usr/bin/env bash

set -euox pipefail

# Install the desktop environment
dnf install -y @workstation-product-environment
systemctl enable gdm.service
