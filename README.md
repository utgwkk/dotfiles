# dotfiles
## apply

```console
$ pip install ansible
$ ansible-playbook -i ./hosts playbooks/*.yml
```

Note that servers in `./hosts` can be connected with SSH.

## apply locally

```console
$ ansible-playbook -c local -i localhost, playbooks/*.yml
```
