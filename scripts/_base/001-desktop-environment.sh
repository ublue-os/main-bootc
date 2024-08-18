#!/usr/bin/env bash

set -euox pipefail

    # # Non-critical apps -> Flatpak
    # - baobab
    # - cheese
    # - snapshot
    # - evince
    # - evince-djvu
    # - evince-nautilus
    # - file-roller
    # - file-roller-nautilus
    # - gnome-boxes
    # - gnome-calculator
    # - gnome-calendar
    # - gnome-characters
    # - gnome-clocks
    # - gnome-connections
    # - gnome-contacts
    # - gnome-documents
    # - gnome-font-viewer
    # - gnome-logs
    # - gnome-maps
    # - gnome-photos
    # - gnome-screenshot
    # - gnome-text-editor
    # - gnome-weather
    # - jwhois
    # - loupe
    # - rdist
    # - sane-backends-drivers-scanners
    # - simple-scan
    # - sushi
    # - symlinks
    # - tcpdump
    # - telnet
    # - totem
    # - totem-nautilus
    # - traceroute


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

# Make excludes a comma-separated string
excludes=$(IFS=, ; echo "${excludes[*]}")

# Install the base-graphical meta-package
dnf install -y @base-graphical \
    --exclude "${excludes}"
