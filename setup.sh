# Setup ~/.bash_profile & ~/.bashrc
if [ -f ~/.bash_profile ];
then
  rm ~/.bash_profile
fi
if [ -f rm ~/.bashrc ];
then
  rm ~/.bashrc
fi
cp ~/bin/defaults/bash_profile ~/.bash_profile
ln -s ~/bin/dotfiles/bashrc ~/.bashrc

# Setup .tm_properties
if [ -f ~/.tm_properties ];
then
  rm ~/.tm_properties
fi
ln -s ~/bin/dotfiles/tm_properties ~/.tm_properties

# Setup .ssh/config
if [ -f ~/.ssh/config ];
then
  rm ~/.ssh/config
fi
ln -s ~/bin/dotfiles/ssh/config ~/.ssh/config

# Setup .vimrc & .vim/
if [ -f ~/.vimrc ];
then
  rm ~/.vimrc
fi
if [ -f rm ~/.vim ];
then
  rm ~/.vim
fi
ln -s ~/bin/dotfiles/vimrc ~/.vimrc
ln -s ~/bin/dotfiles/vim ~/.vim

# Setup ~/.zshrc
if [ -f ~/.zshrc ];
then
  rm ~/.zshrc
fi
ln -s ~/bin/dotfiles/zshrc ~/.zshrc