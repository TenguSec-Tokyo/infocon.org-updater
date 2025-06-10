#!/usr/bin/env bash

BASE_URL="https://infocon.org/"
TARGET_DIR="/mnt/InfoCon2024"

# Make sure your archive mount is ready
mkdir -p "$TARGET_DIR"

# Mirror root-level folders exactly, skip unwanted dirs & query strings
wget -r \
     --no-parent \
     -nH \
     -N \
     -R "index.html*" \
     --reject-regex '.*\?.*' \
     --exclude-directories="/fancyindex,/rainbow%20tables" \
     -P "$TARGET_DIR" \
     "$BASE_URL"
