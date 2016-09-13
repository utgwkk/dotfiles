# vim:set ft=zsh :
export LANG=ja_JP.UTF-8
export LANGUAGE=$LANG
export DISPLAY=:99.0

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

setopt PROMPT_SUBST
source ~/.dotfiles/git-prompt.sh
PS1="%{${fg[red]}%}[%n@%m]%{${fg[yellow]}%}\$(__git_ps1)%{${reset_color}%} %~
% %{${fg[green]}%}%%%{${reset_color}%} "

zstyle ':completion:*:*:git:*' script ~/.dotfiles/git-completion.zsh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

source ~/.zsh_aliases

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH="/home/vagrant/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/vagrant/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/vagrant/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/vagrant/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/vagrant/perl5"; export PERL_MM_OPT;
