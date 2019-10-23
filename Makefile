YAML=default.yml
ANSIBLE_OPTS=-D

.PHONY: local
local:
	pipenv run ansible-playbook -c local -i localhost, $(ANSIBLE_OPTS) $(YAML)
