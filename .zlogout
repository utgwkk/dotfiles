if [ ! -z "$SSH_AUTH_SOCK" ]; then
  eval `ssh-agent -k`
fi

rm -rf ~/tmp/*
