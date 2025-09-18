#!/bin/bash
#
# Cleanup old directories.  It does the following:
#   1. Unstow
#   2. Remove directory
#
set -ex

# get a stow directory
STOW=$(ls -d stow* | head -1)

# exclude current versions in Makefile
declare -A exclude_dict
for dir in $(grep '^[A-Z_0-9]*\s*=' Makefile | sed -E 's/.*=\s*//'); do
    exclude_dict["$dir"]=1
done

# iterate through  current directory
for dir in [a-z]*/; do
    dir=${dir%/}

    if [[ -z "${exclude_dict[$dir]}" ]]; then
        echo "Clean: $dir"
	${STOW}/bin/stow -D "$dir"
        rm -rf "$dir"
	rm -f Src/"${dir}"*
    fi
done
