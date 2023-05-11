# 00-classe-login.sh - login script for CLASSE machines
#
# Login script sourced from .bash_profile to setup thing that need to
# be different when running on CLASSE computers.  This includes
# standalone setups like laptops and machines with shared home
# directories.


# setup for shared home directory
if [ "${SHARED_HOME}" == "YES" ]; then
    export CHESS_DIR="/nfs/chess/user/${USER}"
    export USER_DIR="/nfs/user/${USER}"

    # move cache directories to /tmp/$USER
    install -d --mode 0700 /tmp/${USER}

    check_dir /tmp/${USER}/cache
    check_link /tmp/${USER}/cache $HOME/.cache

    check_dir /tmp/${USER}/openjfx
    check_link /tmp/${USER}/openjfx $HOME/.openjfx
fi
