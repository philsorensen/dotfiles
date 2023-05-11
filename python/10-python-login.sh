# 10-python-login.sh - login script for python
#
# Login script sourced from .bash_profile to setup things that need to
# be setup for python.


# setup for shared home directory
if [ "${SHARED_HOME}" == "YES" ]; then
    # change "user" directory to distro specific directory
    export PYTHONUSERBASE="${HOME}/${DOTLOCAL}"

    # move location of pipx storage and bin to distro specfic directories
    export PIPX_HOME="${CHESS_DIR}/Python/pipx/${DISTRO}"
    export PIPX_BIN_DIR="${HOME}/${DOTLOCAL}/bin"

    # set virtualenv directory
    export WORKON_HOME="${CHESS_DIR}/Python/venvs"
fi
