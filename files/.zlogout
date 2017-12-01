if [ ! -z "$SSH_AUTH_SOCK" ] && [ ! -z "$TMUX" ]; then
  eval `ssh-agent -k`
fi
