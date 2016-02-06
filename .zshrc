# vim:set ft=zsh :
export LANG=ja_JP.UTF-8
export LANGUAGE=$LANG

autoload -U colors && colors
autoload -Uz compinit
compinit

setopt auto_pushd
setopt pushd_ignore_dups

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt share_history
setopt hist_ignore_all_dups
setopt extended_glob

alias l='ls'
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias grep='grep --color=auto'
alias C='g++ -std=c++11 '
alias A='./a.out < in.txt'
alias vimrc='vim ~/.vimrc'
alias rails='bin/rails'

setopt PROMPT_SUBST
source ~/.dotfiles/git-prompt.sh
PS1="%{${fg[red]}%}[%n@%m]%{${fg[green]}%}\$(__git_ps1)%{${reset_color}%} %~
% ( ^o^) < "

zstyle ':completion:*:*:git:*' script ~/.dotfiles/git-completion.zsh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

source ~/.zsh_profile
