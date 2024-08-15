#!/usr/bin/env bash

set -euox pipefail

# Install the desktop environment
dnf install -y @gnome-desktop
