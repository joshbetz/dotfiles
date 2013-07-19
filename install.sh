#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup ZSH
if ! [ -h ~/.zshrc ]; then
	[ -e ~/.zshrc.local ] && mv ~/.zshrc.local ~/.zshrc.local.bak
	[ -e ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.local
else
	rm ~/.zshrc
fi
ln -s $DIR/shellrc ~/.zshrc

# Setup Bash
if ! [ -h ~/.bashrc ]; then
	[ -e ~/.bashrc.local ] && mv ~/.bashrc.local ~/.bashrc.local.bak
	[ -e ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.local
else
	rm ~/.bashrc
fi
ln -s $DIR/shellrc ~/.bashrc

# Setup VIM
if ! [ -h ~/.vimrc ]; then
	[ -e ~/.vimrc.local ] && mv ~/.vimrc.local.bak
	[ -e ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.local
else
	rm ~/.vimrc
fi
ln -s $DIR/vimrc ~/.vimrc

[ -e ~/.vim ] && mv ~/.vim ~/.vim.bak
ln -s $DIR/vim ~/.vim

# Setup git
rm -rf ~/.gitconfig
rm -rf ~/.gitignore
ln -s $DIR/gitconfig ~/.gitconfig
ln -s $DIR/gitignore ~/.gitignore

# Setup ack
rm -rf ~/.ackrc
ln -s $DIR/ackrc ~/.ackrc

# Setup tmux
rm -rf ~/.tmux.conf
ln -s $DIR/tmux ~/.tmux.conf

# Setup ruby
rm -rf ~/.gemrc
ln -s $DIR/gemrc ~/.gemrc

# Move Sublime files into place
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3
ln -s $DIR/Sublime\ Text\ 3 ~/Library/Application\ Support/
