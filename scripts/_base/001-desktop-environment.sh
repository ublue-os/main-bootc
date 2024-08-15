#!/usr/bin/env bash

set -euox pipefail

# Install the base-graphical meta-package
dnf install -y @base-graphical
