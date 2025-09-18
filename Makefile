#
# Install dotfiles and dependencies
#
# This makefile simplifies the installation of the dotfiles and their
# needed dependencies.  The main target install/updates the
# dependencies using ansible and then uses stow to install the actual
# configuration files.

.PHONY: all os-setup stow

all: os-setup stow


os-setup:
	ansible-playbook playbooks/dotfiles.yaml

.ONESHELL:
stow:
	stow -v bash starship tmux
	source $(HOME)/.config/bash/environment
	[[ $(DISTRO) == el* ]] && stow -v classe

