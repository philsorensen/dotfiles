# 20-ssh-krb-rc.sh - setup ssh wrapper scripts
#
# Wrappers for using kerberos tickets and ssh.  The wrappers handle
# the kinit and kswitch if needed.
#

export KUSER=${1:-$USER}
export UPN=$(klist -l | sed -n '3p' | awk '{print $1}')

set_upn() {
    user=${1:-$KUSER}
    upn=${user}@CLASSE.CORNELL.EDU

    kswitch -p ${upn} 2>/dev/null || kinit -fp ${upn}
    ret=$?
    UPN=$(klist -l | sed -n '3p' | awk '{print $1}')

    return $ret
}

ssh_wrapper() {
    host=$1 ; shift; ssh $host "$@"
}
root_wrapper() {
    host=$1; shift
    [ "$host" == "" -o "$host" == "-e" ] && host=$HOSTNAME

    ssh_wrapper root@$host "$@"
}

remote () {
    set_upn ${KUSER} && ssh_wrapper "$@"
}
root () {
    set_upn admin-${KUSER} && root_wrapper "$@"
}
rootdo () {
    set_upn admindo-${KUSER} && root_wrapper "$@"
}
