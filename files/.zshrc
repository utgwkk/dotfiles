# vim:set ft=zsh :
autoload -U colors && colors
autoload -Uz compinit
compinit

setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_space

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

setopt PROMPT_SUBST
source ~/local/etc/git-prompt.sh
PS1="%{${fg[green]}%}[%n@%m]%{${fg[red]}%} %(?..[%?] )%{${fg[cyan]}%}\$(date +%H:%M:%S)%{${fg[yellow]}%}\$(__git_ps1)%{${reset_color}%} %~
% %{${fg[red]}%}%%%{${reset_color}%} "

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:*:git:*' script ~/local/etc/git-completion.zsh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

source ~/.aliases
export LESS='-i -M -R -W'
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

export PATH=$PATH:/usr/local/bin:$HOME/local/bin

# apply local .zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
