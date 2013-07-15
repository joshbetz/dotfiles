#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Move Shell files into place
[ -e ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.local
[ -e ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.local
ln -s $DIR/shellrc ~/.zshrc
ln -s $DIR/shellrc ~/.bashrc

# Setup VIM
[ -e ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.local
ln -s $DIR/vimrc ~/.vimrc

# Setup git
rm -rf ~/.gitconfig
rm -rf ~/.gitignore
ln -s $DIR/gitconfig ~/.gitconfig
ln -s $DIR/gitignore ~/.gitignore

# Setup ack
rm -rf ~/.ackrc
ln -s $DIR/ackrc ~/.ackrc

# Setup ruby
rm -rf ~/.gemrc
ln -s $DIR/gemrc ~/.gemrc

# Move Sublime files into place
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3
ln -s $DIR/Sublime\ Text\ 3 ~/Library/Application\ Support/
