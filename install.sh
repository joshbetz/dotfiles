#!/bin/bash

# Get current directory
CUR = pwd

# Move Shell files into place
rm -rf .zshrc
rm -rf .bashrc
ln -s ~/bin/dotfiles/shellrc ~/.zshrc
ln -s ~/bin/dotfiles/shellrc ~/.bashrc

# Setup git
rm -rf ~/.gitconfig
rm -rf ~/.gitignore
ln -s ~/bin/dotfiles/gitconfig ~/.gitconfig
ln -s ~/bin/dotfiles/gitignore ~/.gitignore

# Setup ruby
rm -rf ~/.gemrc
ln -s ~/bin/dotfiles/gemrc ~/.gemrc

# Move Sublime files into place
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3
ln -s ~/bin/dotfiles/Sublime\ Text\ 3 ~/Library/Application\ Support/
