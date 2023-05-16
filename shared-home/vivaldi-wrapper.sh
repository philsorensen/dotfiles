#!/bin/bash
#  Wrapper script for hostname based vivaldi profiles
vivaldi_bin=/opt/vivaldi/vivaldi

profile=$(hostname -s)
[ -n "${NX_SESSION_ID}" ] && profile="${profile}-NX"

exec $vivaldi_bin --disk-cache-size=24000000 \
                  --proxy-pac-url=https://www.classe.cornell.edu/proxy.pac \
                  --profile-directory=$profile "$@"
