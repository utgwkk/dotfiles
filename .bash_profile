export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias ls='ls --color=auto'
alias ll='ls -lF'
alias la='ls -a'
alias l='ls -p'
alias ks='ls'
alias grep='grep --color=auto'
alias cls='clear'
alias sx9='xdg-open http://sx9.jp/weather/kyoto.html'
alias ninetan='sx9'
alias a='atom'
alias g='git'

if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi

eval `ssh-agent` > /dev/null
ssh-add > /dev/null 2>&1
