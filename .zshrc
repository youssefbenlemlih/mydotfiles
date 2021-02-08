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

[ -d $HOME/.oh-my-zsh ]&& export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export PATH="$PATH:$HOME/scripts"
export CLASSPATH="$HOME/.javaoutput"

alias -s md="vim"
alias -s pdf="mupdf -I"
alias lp='stat -c "%a %n" -- *'
alias gco.="gco ."
alias md='mkdir'
alias mu="mupdf -I"
alias tst="tig status"
alias v="vim"
alias vrc="vim ~/.vimrc"
alias vzsh="vim ~/.zshrc"

command -v lsd && alias ls="lsd"
# command -v nuget.exe && [[ ! command -v nuget ]] && alias nuget="nuget.exe"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -d /usr/local/go/bin ] && export PATH=$PATH:/usr/local/go/bin

if grep -q Microsoft /proc/version; then
  export WINDOWS="1"
  export WINDOWS_USERNAME=${$(cmd.exe /c "echo %USERNAME%")%?}
fi

if [[ "$HOST" = "Youssef-PC" ]]; then
  # HP specifics
  export NVM_DIR="$HOME/.nvm"
  PATH=$PATH:/mnt/c/Users/Youssef/Desktop/work

elif [[ "$HOST" = "???" ]]; then
  # Work computer specifics
fi

if [[ "$WINDOWS" = "1" ]]; then
  alias code="wstart 'C:\\Users\\$WINDOWS_USERNAME\\AppData\\Local\\Programs\\Microsoft\ VS\ Code\\Code.exe'"
  alias desktop="wstart 'C:\\Users\\$WINDOWS_USERNAME\\AppData\\Local\\GitHubDesktop\\GitHubDesktop.exe'"
  alias wstart="/mnt/c/Windows/System32/cmd.exe /C start"
  alias devenv="/mnt/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2019/Professional/Common7/IDE/devenv.exe"
  alias vs="wstart *.sln"
  export BROWSER="/mnt/c/Windows/System32/cmd.exe /C start"
fi

initnvm(){
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
initnvm
