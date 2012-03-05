# Make a place to backup the files
mkdir -p ~/bin/settings_backup

# Setup ~/.bash_profile & ~/.bashrc
if [ -f ~/.bash_profile ];
then
  mv ~/.bash_profile ~/bin/settings_backup
fi
if [ -f rm ~/.bashrc ];
then
  mv ~/.bashrc ~/bin/settings_backup
fi
if [ `uname` -eq 'Darwin' ];
then
  cp ~/bin/dotfiles/bash_profile ~/.bash_profile
fi
ln -s ~/bin/dotfiles/bashrc ~/.bashrc

# Setup .tm_properties
if [ -f ~/.tm_properties ];
then
  mv ~/.tm_properties ~/bin/settings_backup
fi
if [ `uname` -eq 'Darwin' ];
then
  ln -s ~/bin/dotfiles/tm_properties ~/.tm_properties
fi

# Setup .ssh/config
if [ -f ~/.ssh/config ];
then
  mv ~/.ssh/config ~/bin/settings_backup
fi
ln -s ~/bin/dotfiles/ssh/config ~/.ssh/config

# Setup .vimrc & .vim/
if [ -f ~/.vimrc ];
then
  mv ~/.vimrc ~/bin/settings_backup
fi
if [ -f rm ~/.vim ];
then
  mv ~/.vim ~/bin/settings_backup
fi
ln -s ~/bin/dotfiles/vimrc ~/.vimrc
ln -s ~/bin/dotfiles/vim ~/.vim

# Setup ~/.zshrc
if [ -f ~/.zshrc ];
then
  mv ~/.zshrc ~/bin/settings_backup
fi
ln -s ~/bin/dotfiles/zshrc ~/.zshrc