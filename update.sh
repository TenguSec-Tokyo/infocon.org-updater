#!/usr/bin/env bash

BASE_URL="https://infocon.org/cons/"
TARGET_DIR="/mnt/InfoCon2024"

# make sure our mount point exists
mkdir -p "$TARGET_DIR"

# mirror only new/changed files, drop host dir, strip 'cons/', skip listings & query-URLs
wget -r \
     --no-parent \
     -nH \
     --cut-dirs=1 \
     -N \
     -R "index.html*" \
     --reject-regex '.*\?.*' \
     --exclude-directories="/fancyindex" \
     -P "$TARGET_DIR" \
     "$BASE_URL"
