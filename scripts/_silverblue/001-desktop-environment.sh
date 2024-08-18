#!/usr/bin/env bash

set -euox pipefail

# Install the desktop environment
excludes=(

    "baobab"
    "cheese"
    "evince"
    "evince-djvu"
    "evince-nautilus"
    "file-roller"
    "file-roller-nautilus"
    "gnome-boxes"
    "gnome-calculator"
    "gnome-calendar"
    "gnome-characters"
    "gnome-clocks"
    "gnome-connections"
    "gnome-contacts"
    "gnome-documents"
    "gnome-font-viewer"
    "gnome-logs"
    "gnome-maps"
    "gnome-photos"
    "gnome-screenshot"
    "gnome-text-editor"
    "gnome-weather"
    "jwhois"
    "loupe"
    "rdist"
    "sane-backends-drivers-scanners"
    "simple-scan"
    "snapshot"
    "sushi"
    "symlinks"
    "tcpdump"
    "telnet"
    "totem"
    "totem-nautilus"
    "traceroute"
)

dnf install -y @gnome-desktop --exclude "${excludes[*]}"
systemctl enable gdm.service
