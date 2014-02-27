#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# =====================================
# Installation Helpers
# =====================================
dotfiles_install() {
	FILE=$1
	rm -rf ~/.$FILE
	ln -s $DIR/$FILE ~/.$FILE
}

dotfiles_backup() {
	FILE=$1
	if ! [ -h ~/.$FILE ]; then
		[ -e ~/.$FILE.local ] && mv ~/.$FILE.local ~/.$FILE.local.bak
		[ -e ~/.$FILE ] && mv ~/.$FILE ~/.$FILE.local
	fi
}

dotfiles_backup_shallow() {
	FILE=$1
	rm -rf ~/.$FILE.bak
	[ -e ~/.$FILE ] && mv ~/.$FILE ~/.$FILE.bak
}

# =====================================
# Setup ZSH
# =====================================
dotfiles_backup zshrc
rm -f ~/.zshrc
ln -s $DIR/shellrc ~/.zshrc


# =====================================
# Setup Bash
# =====================================
dotfiles_backup bashrc
rm -f ~/.bashrc
ln -s $DIR/shellrc ~/.bashrc


# =====================================
# Setup Atom
# =====================================
dotfiles_install atom


# =====================================
# Setup VIM
# =====================================
dotfiles_backup vimrc
ln -sf $DIR/vimrc ~/.vimrc.fork
ln -sf $DIR/vimrc.bundles ~/.vimrc.bundles.fork

dotfiles_backup gvimrc
ln -sf $DIR/gvimrc ~/.gvimrc.local

dotfiles_backup_shallow vim
dotfiles_install vim

# Run spf13 installer
sh <(curl https://j.mp/spf13-vim3 -L)

# =====================================
# Setup git
# =====================================
dotfiles_install gitconfig
dotfiles_install gitignore


# =====================================
# Setup ack
# =====================================
dotfiles_backup_shallow ackrc
dotfiles_install ackrc


# =====================================
# Setup screen
# =====================================
dotfiles_backup screenrc
dotfiles_install screenrc


# =====================================
# Setup tmux
# =====================================
dotfiles_backup_shallow tmux.conf
dotfiles_install tmux.conf


# =====================================
# Setup ruby
# =====================================
dotfiles_backup_shallow gemrc
dotfiles_install gemrc


# =====================================
# Setup Vagrant
# =====================================
mkdir -p ~/.vagrant.d/
ln -sf $DIR/Vagrantfile ~/.vagrant.d/Vagrantfile
