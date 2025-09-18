# 10-python-login.sh - login script for python
#
# Login script sourced from .bash_profile to setup things that need to
# be setup for python.


# setup for shared home directory
if [ "${SHARED_HOME}" == "YES" ]; then
    # change "user" directory to distro specific directory
    export PYTHONUSERBASE="${DOT_LOCAL}"

    # move location of pipx storage and bin to distro specfic directories
    export PIPX_HOME="${SCRATCH_DIR}/Python/pipx-${DISTRO}"
    export PIPX_BIN_DIR="${DOT_LOCAL}/bin"
    export PIPX_MAN_DIR="${DOT_LOCAL}/share/man"
fi
