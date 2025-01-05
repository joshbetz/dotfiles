#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config

# Shell
ln -sfnv $DIR/starship.toml ~/.config/starship.toml
ln -sfnv $DIR/shellrc ~/.zshrc
ln -sfnv $DIR/shellrc ~/.bashrc
source $DIR/shellrc

# Ghostty
mkdir -p ~/.config/ghostty
ln -sfnv $DIR/.config/ghostty/config ~/.config/ghostty/config

# GPG
mkdir -p ~/.gnupg
ln -sfnv $DIR/gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -sfnv $DIR/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# Vim
python3 -m pip install --break-system-packages --user 'pynvim @ git+https://github.com/'
mkdir -p ~/.config/nvim
ln -sfnv $DIR/nvim ~/.config/nvim/init.vim
ln -sfnv $DIR/vimrc ~/.vimrc
ln -sfnv $DIR/gvimrc ~/.gvimrc
mkdir -p ~/.vim/after/ftplugin
find $DIR/.vim -type f | xargs -I{} ln -snfv {} $HOME/{}
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

# config npm
npm config set audit=false --location user
npm config set fund=false --location user
npm config set loglevel=warn --location user
