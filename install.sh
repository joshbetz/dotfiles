#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Shell
ln -sfnv $DIR/shellrc ~/.zshrc
ln -sfnv $DIR/shellrc ~/.bashrc

# Hyperterm
ln -sfnv $DIR/hyperterm.js ~/.hyperterm.js

# Vim
ln -sfnv $DIR/vim ~/.vim
ln -sfnv $DIR/vimrc ~/.vimrc
ln -sfnv $DIR/gvimrc ~/.gvimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Git
ln -sfnv $DIR/gitconfig ~/.gitconfig
ln -sfnv $DIR/gitignore ~/.gitignore
