#!/bin/bash
set +xe

p=${1%-*}
v=${1##*-}

dunst_url="https://github.com/dunst-project/dunst/archive/refs/tags/v${v}.tar.gz"
feh_url="https://feh.finalrewind.org/feh-${v}.tar.bz2"
ghostty_url="https://github.com/ghostty-org/ghostty/archive/refs/tags/v${v}.tar.gz"
i3_url="https://i3wm.org/downloads/i3-${v}.tar.xz"
picom_url="https://github.com/yshui/picom/archive/refs/tags/v${v}.tar.gz"
rofi_url="https://github.com/davatorium/rofi/releases/download/${v}/rofi-${v}.tar.gz"
stow_url="https://ftpmirror.gnu.org/stow/stow-${v}.tar.gz"
tmux_url="https://github.com/tmux/tmux/releases/download/${v}/tmux-${v}.tar.gz"
xss_lock_url="http://deb.debian.org/debian/pool/main/x/xss-lock/xss-lock_${v}.orig.tar.gz"
xssproxy_url="https://github.com/vincentbernat/xssproxy/archive/refs/tags/v${v}.tar.gz"

url="$(echo ${p} | tr '-' '_')_url"
if wget -P Src/ "${!url}"; then
    [ -e "Src/v${v}.tar.gz" ] && \
        mv Src/v${v}.tar.gz Src/$1.tar.gz
    [ -e "Src/xss-lock_${v}.orig.tar.gz" ] && \
         mv Src/xss-lock_${v}.orig.tar.gz Src/$1.tar.gz

    echo ""
fi
