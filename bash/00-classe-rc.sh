# 00-classe-rc.sh - interactive shell script for CLASSE machines
#
# Script source from .bashrc to setup configuration specific to CLASSE
# including both laptops and shared home directories.
#

# activate some Software Collection on SL7
if [ "${DISTRO}" == "el7" ]; then
    source scl_source enable llvm-toolset-7.0 rh-git218 rh-nodejs14
fi


# setup for shared home directory
if [ "${SHARED_HOME}" == "YES" ]; then
    # network file share aliases
    alias chessdir="cd ${CHESS_DIR}"
    alias userdir="cd ${USER_DIR}"
fi
