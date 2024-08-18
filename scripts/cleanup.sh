#!/usr/bin/env bash

set -euox pipefail

# Clear directories
rm -rf /tmp/*

# Cleanup DNF
dnf clean all

# Generate initramfs
mkdir -p /var/tmp
KERNEL_SUFFIX=""
QUALIFIED_KERNEL="$(rpm -qa | grep -P 'kernel-(|'"$KERNEL_SUFFIX"'-)(\d+\.\d+\.\d+)' | sed -E 's/kernel-(|'"$KERNEL_SUFFIX"'-)//')"
dracut --kver "$QUALIFIED_KERNEL" --reproducible -vf "/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
