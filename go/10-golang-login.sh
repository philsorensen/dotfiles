# 10-golang-login.sh - login script for go
#
# Login script sourced from .bash_profile that set the GOPATH and adds
# it GOPATH/bin to PATH.
#

if [ "${SHARED_HOME}" == "YES" ]; then
    export GOPATH="${CHESS_DIR}/Go"
else
    export GOPATH="${HOME}/Programs/Go"
fi

alter_path add ${GOPATH}/bin

