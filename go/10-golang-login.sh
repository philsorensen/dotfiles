# 10-golang-login.sh - login script for go
#
# Login script sourced from .bash_profile that set the GOPATH and adds
# it GOPATH/bin to PATH.
#

if [ "${SHARED_HOME}" == "YES" ]; then
    export GOROOT="${CHESS_DIR}/Go/go"
    export GOPATH="${CHESS_DIR}/Go/workspace"
else
    export GOROOT="${HOME}/Programs/Go/go"
    export GOPATH="${HOME}/Programs/Go/workspace"
fi

alter_path add ${GOPATH}/bin

