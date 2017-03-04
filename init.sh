#!/bin/sh

if [ ! -d ~/.dotfiles ]; then
  echo "Setting dotfiles."
  git clone https://github.com/utgw/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  cd ~/
  for f in `find ~/.dotfiles -maxdepth 1 -name ".*" -type f`; do
    ln -sf $f
  done
else
  echo "dotfiles are already configured."
fi


if ! type pyenv >/dev/null 2>&1; then
  echo "Installing pyenv."
  git clone git://github.com/yyuu/pyenv.git ~/.pyenv
else
  echo "pyenv is already installed."
fi

if ! type rbenv >/dev/null 2>&1; then
  echo "Installing rbenv."
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
else
  echo "rbenv is already installed."
fi

# It doesn't work...
#if ! type nvm >/dev/null 2>&1; then
if [ ! -d ~/.nvm ]; then
  echo "Installing nvm."
  git clone https://github.com/creationix/nvm.git ~/.nvm
  source ~/.nvm/nvm.sh
else
  echo "nvm is already installed."
fi

source ~/.bash_profile
echo "Finished."
