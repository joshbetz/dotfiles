#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config

# Shell
ln -sfnv $DIR/starship.toml ~/.config/starship.toml
ln -sfnv $DIR/shellrc ~/.zshrc
ln -sfnv $DIR/shellrc ~/.bashrc
source $DIR/shellrc

# Hyperterm
ln -sfnv $DIR/hyperterm.js ~/.hyperterm.js

# GPG
mkdir -p ~/.gnupg
ln -sfnv $DIR/gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -sfnv $DIR/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# Vim
mkdir -p ~/.config/nvim
ln -sfnv $DIR/nvim ~/.config/nvim/init.vim
ln -sfnv $DIR/vimrc ~/.vimrc
ln -sfnv $DIR/gvimrc ~/.gvimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall! +PlugUpdate +PlugClean! +qall

# Git
ln -sfnv $DIR/gitconfig ~/.gitconfig
ln -sfnv $DIR/gitignore ~/.gitignore

# pt
ln -sfnv $DIR/ptconfig.toml ~/.ptconfig.toml

# screen
cp $DIR/screenrc ~/.screenrc
