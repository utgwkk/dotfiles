YAML=default.yml
PIPENV=$(shell which pipenv)
ANSIBLE=$(PIPENV) run ansible-playbook
LOCAL_OPTS=-c local -i localhost,
ANSIBLE_OPTS=-D

.PHONY: check-pipenv-is-installed
check-pipenv-is-installed:
	which pipenv || ( echo 'Please install pipenv.' && exit 1 )

.PHONY: local
local: check-pipenv-is-installed
	$(ANSIBLE) $(LOCAL_OPTS) $(ANSIBLE_OPTS) $(YAML)

.PHONY: dry-run
dry-run: check-pipenv-is-installed
	$(ANSIBLE) $(LOCAL_OPTS) -C $(ANSIBLE_OPTS) $(YAML)
