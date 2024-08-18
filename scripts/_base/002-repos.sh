#!/usr/bin/env bash

set -euox pipefail

# Setup RPMFusion repositories
rpm-ostree install \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

rpm-ostree install \
  rpmfusion-nonfree-release  \
  rpmfusion-free-release  \
  --uninstall=rpmfusion-free-release-$(rpm -E %fedora)-1.noarch  \
  --uninstall=rpmfusion-nonfree-release-$(rpm -E %fedora)-1.noarch

sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/fedora-{updates-archive,cisco-openh264}.repo

cat << EOF  > /etc/yum.repos.d/kylegospo-oversteer.repo
[copr:copr.fedorainfracloud.org:kylegospo:oversteer]
name=Copr repo for oversteer owned by kylegospo
baseurl=https://download.copr.fedorainfracloud.org/results/kylegospo/oversteer/fedora-$releasever-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://download.copr.fedorainfracloud.org/results/kylegospo/oversteer/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
EOF
