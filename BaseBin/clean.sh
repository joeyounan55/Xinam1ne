#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Remove temporary build directories and files
rm -rf .tmp basebin.tc
rm -f ../Dopamine/Dopamine/bootstrap/basebin.tar

# Remove copied headers
rm -rf _shared/libfilecom _shared/libjailbreak

# Remove built binaries and libraries
rm -f libfilecom/libfilecom.dylib
rm -f libjailbreak/libjailbreak.dylib
rm -f jailbreakd/jailbreakd
rm -f idownloadd/idownloadd
rm -f boomerang/boomerang
rm -f jbinit/jbinit
rm -f jbctl/jbctl
rm -f launchdhook/launchdhook.dylib
rm -f systemhook/systemhook.dylib
rm -f watchdoghook/watchdoghook.dylib
rm -f rootlesshooks/.theos/obj/rootlesshooks.dylib
rm -rf rootlesshooks/.theos
rm -f forkfix/forkfix.dylib

# Remove generic build artefacts
find . -name '*.o' -delete
find . -name '*.dylib.dSYM' -type d -prune -exec rm -rf {} +

# Call make clean in subdirectories when available
for dir in libfilecom libjailbreak jailbreakd idownloadd boomerang jbinit jbctl launchdhook systemhook watchdoghook rootlesshooks forkfix; do
    if [ -f "$dir/Makefile" ]; then
        (cd "$dir" && make clean >/dev/null 2>&1 || true)
    fi
done

