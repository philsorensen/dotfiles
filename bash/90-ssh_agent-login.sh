# 90-ssh_agent-login.sh - Make sure a SSH agent is running.
#
# Setup file to make sure that some form of SSH agent is running.  The
# order if tries things are
#   1. SSH forwarded agent
#   2. gnome-keyring-daemon
#   3. standard ssh-agent
#

# only run if not forwarded agent 
if [ -z "${SSH_AUTH_SOCK}" -o -n "${SSH_AGENT_PID}" ]; then
    if [ -n "$(command -v gnome-keyring-daemon)" ]; then
        # use gnome-keyring-daemon
        [ -n "${SSH_AGENT_PID}" ] && eval $(ssh-agent -s -k)
        if [ -n "${XDG_CURRENT_DESKTOP}" ]; then
            eval $(gnome-keyring-daemon -d -s -c secrets,ssh,pkcs)
        else
            eval $(gnome-keyring-daemon -d -c secrets,ssh,pkcs) 
        fi
        export SSH_AUTH_SOCK
    else
        # use ssh-agent
        eval $(ssh-agent -s)
        export SSH_AGENT_PID SSH_AUTH_SOCK
    fi
fi
