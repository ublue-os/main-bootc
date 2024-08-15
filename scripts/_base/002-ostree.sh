#!/usr/bin/env bash

set -euox pipefail

dnf install -y @workstation-ostree-support

cat > /usr/lib/ostree/prepare-root.conf << EOF
[composefs]
enabled = no
[sysroot]
readonly = true
EOF
