# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugin dirs
#  ~/.oh-my-zsh/plugins/*
#  ~/.oh-my-zsh/custom/plugins/
plugins=(git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export BROWSER="firefox"
export EDITOR='vim'
export PATH=$PATH:"/home/youssef/scripts"
export PATH="$PATH:/opt/react-native-debugger"

alias md='mkdir'
alias ls='lsd'
alias lp='stat -c "%a %n" -- *'
alias initnvm='source /usr/share/nvm/init-nvm.sh'
alias vimwiki='vim ~/study.wiki/index.md'
mu() { mupdf -I  "$@" &> /dev/null & }

#rxvt config
#exec xrdb ~/.Xdefaults ~/.Xresource
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
