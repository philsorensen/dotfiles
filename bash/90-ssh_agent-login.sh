# 90-ssh_agent-login.sh - Make sure a SSH agent is running.
#
# Setup file to make sure that some form of SSH agent is running.  It
# uses the standard ssh-agent.
#

# only run if there is not an "active" .#90-ssh_agent-login.sh
if [ -z "${SSH_AUTH_SOCK}" -o -n "${SSH_AGENT_PID}" ]; then
    eval $(ssh-agent -s)
    export SSH_AGENT_PID SSH_AUTH_SOCK
fi
