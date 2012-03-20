# Symlink to this file from ~/.zshrc

setopt prompt_subst
setopt hist_ignore_dups

. ~/bin/dotfiles/bash/env
. ~/bin/dotfiles/bash/aliases

. ~/bin/dotfiles/zsh/rc
. ~/bin/dotfiles/zsh/prompt
. ~/bin/dotfiles/zsh/aliases
. ~/bin/dotfiles/zsh/git_aliases
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
