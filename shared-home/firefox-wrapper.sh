#!/bin/bash
#  Use hostname based profiles for firefox
firefox_bin="/usr/bin/firefox"

profile=$(hostname -s)
[ -n "${NX_SESSION_ID}" ] && profile="${profile}-NX"

exec $firefox_bin -P $profile "$@"
