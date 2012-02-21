# Setup ~/.bash_profile & ~/.bashrc
rm ~/.bash_profile ~/.bashrc
cp ~/bin/defaults/bash_profile ~/.bash_profile
cp ~/bin/defaults/bashrc ~/.bashrc

# Setup .tm_properties
rm ~/.tm_properties
ln -s ~/bin/dotfiles/tm_properties ~/.tm_properties

# Setup .ssh/config
rm ~/.ssh/config
ln -s ~/bin/dotfiles/ssh/config ~/.ssh/config

# Setup .vimrc & .vim/
rm ~/.vimrc ~/.vim
ln -s ~/bin/dotfiles/vimrc ~/.vimrc
ln -s ~/bin/dotfiles/vim ~/.vim