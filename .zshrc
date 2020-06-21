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

[ -d $HOME/oh-my-zsh ]&& export ZSH=$HOME/oh-my-zsh
[ -d $HOME/.oh-my-zsh ]&& export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export BROWSER="firefox"
export EDITOR='vim'
export PATH=$PATH:"/home/youssef/scripts"
export PATH="$PATH:/opt/react-native-debugger"
export CLASSPATH=/home/youssef/.javaoutput

alias md='mkdir'
command -v lsd && alias ls='lsd'
alias lp='stat -c "%a %n" -- *'
alias initnvm='source /usr/share/nvm/init-nvm.sh'
alias vimwiki='vim ~/study.wiki/index.md'
#Windows
alias wstart="/cygdrive/c/Windows/System32/cmd.exe /C start"
alias vs="chmod 770 *.sln && wstart *.sln && chmod 664 *.sln"
alias devenv="/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2019/Professional/Common7/IDE/devenv.exe"
[ -f ~/$ZSH//cygdrive/c ] && PATH=$PATH:/cygdrive/c/cygwin64/bin:/cygdrive/c/Users/Youssef/Desktop/work
mu() { mupdf -I  "$@" &> /dev/null & }

#rxvt config
#exec xrdb ~/.Xdefaults ~/.Xresource
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
