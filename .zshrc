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

export BROWSER="/mnt/c/Windows/System32/cmd.exe /C start"
export EDITOR='vim'
export PATH="$PATH:$HOME/scripts"
export CLASSPATH="$HOME/.javaoutput"

alias -s md="vim"
alias -s pdf="mupdf -I"
alias lp='stat -c "%a %n" -- *'
alias md='mkdir'
alias mu="mupdf -I"
alias tst=tig status
alias vrc='vim ~/.vimrc'
alias vzsh='vim ~/.zshrc'

command -v lsd && alias ls='lsd'

if [[ "$HOST" = "Youssef-PC" ]]; then
  export NVM_DIR="$HOME/.nvm"
  PATH=$PATH:/mnt/c/Users/Youssef/Desktop/work
  export WINDOWS="1"
elif [[ "$HOST" = "YBenlemlih" ]]; then
  export WINDOWS="1"
elif [[ "$HOST" = "t43" ]]; then
  export NVM_DIR="/usr/share/nvm"
else
  echo "set NVM_DIR !"
fi

if [[ "$WINDOWS" = "1" ]]; then
  alias wstart="/mnt/c/Windows/System32/cmd.exe /C start" #Windows
  alias code="/mnt/c/Users/$HOST/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
  # alias desktop="wstart 'C:\Users\$HOST\AppData\Local\GitHubDesktop\GitHubDesktop.exe'"
  alias devenv="/mnt/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2019/Professional/Common7/IDE/devenv.exe"
  alias vs="chmod 770 *.sln && wstart *.sln && chmod 664 *.sln"
fi

initnvm(){
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
initnvm
alias vs="chmod 770 *.sln && wstart *.sln && chmod 664 *.sln"
alias wstart="cmd.exe /C start"
alias code="/mnt/c/Users/YBenlemlih/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
alias desktop="wstart 'C:\Users\YBenlemlih\AppData\Local\GitHubDesktop\GitHubDesktop.exe'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -d /usr/local/go/bin ] && export PATH=$PATH:/usr/local/go/bin
alias tst="tig status"
alias v="vim"
