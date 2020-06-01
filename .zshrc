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

alias md='mkdir'

#my scripts
export PATH=$PATH:"/home/youssef/scripts"
#react native debugger
export PATH="$PATH:/opt/react-native-debugger"

#rxvt config
#exec xrdb ~/.Xdefaults ~/.Xresource

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
