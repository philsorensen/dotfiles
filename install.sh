#!/bin/bash
#
# Install dotfiles and related objects.
#
# The script can run in different ways.
#  - no parameter         -> do a "full" install
#  - parameter is "shell" -> run shell.yaml  playbook
#  - any other parameter  -> run run.yaml playbook with paramter as
#                           module
#
cd "$(dirname ${BASH_SOURCE[0]})/.ansible"


tags="untagged"

# check for ansible-playbook
if ! command -v ansible-playbook >/dev/null; then
    echo "Need ansible-playbook on the PATH"
    exit 1
fi

# set tags
[ "$(hostname | sed 's/[^\.]*\.//')" == "classe.cornell.edu" ] \
                                              && tags="${tags},classe"
[ "$(stat --format=%T -f ${HOME})" == "nfs" ] && tags="${tags},shared-home"

# run playbooks
if [ -z "$1" ]; then
    # run full install/update
    #  - install collections/roles
    #  - run shell.yaml playbook for shell related things
    #  - source new shell environment
    #  - run dotfiles.yaml playbook
    ansible-galaxy install -r requirements.yaml

    if ansible-playbook ../shell.yaml --tags="${tags}"; then
        source ${HOME}/.bash_profile
        ansible-playbook ../dotfiles.yaml --tags="${tags}"
    fi
elif [ "$1" == "shell" ]; then
    ansible-playbook ../shell.yaml --tags="${tags}"
else
    ansible-playbook ../run.yaml --tags="${tags}" --extra-vars="module=$1"
fi
