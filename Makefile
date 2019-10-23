YAML=default.yml

.PHONY: local
local:
	pipenv run ansible-playbook -c local -i localhost, $(YAML)
