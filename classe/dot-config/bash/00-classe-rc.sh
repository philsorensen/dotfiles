# 00-classe-rc.sh - interactive shell script for CLASSE machines
#
# Script source from .bashrc to setup configuration specific to CLASSE
# including both laptops and shared home directories.
#

# Add local module directory
module use ${HOME}/.config/modulefiles


# setup for shared home directory
if [ "${SHARED_HOME}" == "YES" ]; then
    # network file share aliases
    alias chessdir="cd ${CHESS_DIR}"
    alias userdir="cd ${USER_DIR}"
fi
