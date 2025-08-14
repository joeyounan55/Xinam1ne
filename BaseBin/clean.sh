#!/bin/sh

set -e

SCRIPT_DIR=$(dirname -- "$0")
cd "$SCRIPT_DIR"

# Remove generated artifacts
dirs=".tmp basebin.tar basebin.tc"
for item in $dirs; do
    [ -e "$item" ] && rm -rf "$item"
done

# Clean subdirectories that produce binaries
for dir in libfilecom libjailbreak jailbreakd idownloadd boomerang jbinit jbctl launchdhook systemhook watchdoghook rootlesshooks forkfix dyldhook; do
    if [ -d "$dir" ]; then
        (cd "$dir" && make clean >/dev/null 2>&1 || true)
    fi
done

cd - >/dev/null
