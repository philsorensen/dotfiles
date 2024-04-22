#!/bin/bash
#  Wrapper script for hostname based vivaldi profiles
vivaldi_bin=/opt/vivaldi/vivaldi
vivaldi_user_dir=${USER_DIR}/Profiles/vivaldi

user_dir="${vivaldi_user_dir}/$(hostname -s)"
[ -n "${NX_SESSION_ID}" ] && user_dir="${user_dir}-NX"

exec $vivaldi_bin --disk-cache-size=24000000 \
                  --proxy-pac-url=https://www.classe.cornell.edu/proxy.pac \
                  --user-data-dir=$user_dir \
                  --profile-directory=Default "$@"
