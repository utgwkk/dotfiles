# Ruby (rbenv)
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Python (pyenv)
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Go (goenv)
if [ -d "$HOME/.goenv" ]; then
  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)"
fi

# Rust (cargo)
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Node.js (nvm)
if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# added by travis gem
[ -f /home/utgwkk/.travis/travis.sh ] && source /home/utgwkk/.travis/travis.sh
