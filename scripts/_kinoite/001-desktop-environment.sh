#!/usr/bin/env bash

set -euox pipefail

# Install the desktop environment
dnf install -y @kde-desktop-environment
systemctl enable sddm.service
