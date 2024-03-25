#!/bin/bash
#  Wrapper to only run thunderbird on systems with local storage setup
tb_bin=/usr/bin/thunderbird

if [ -e /mnt/scratch/thunderbird ]; then
    exec $tb_bin "$@"
else
    echo "Thunderbird not setup on this computer" >&2
    exit 1
fi
