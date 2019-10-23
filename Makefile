YAML=default.yml
ANSIBLE=pipenv run ansible-playbook
LOCAL_OPTS=-c local -i localhost,
ANSIBLE_OPTS=-D

.PHONY: local
local:
	$(ANSIBLE) $(LOCAL_OPTS) $(ANSIBLE_OPTS) $(YAML)

.PHONY: dry-run
dry-run:
	$(ANSIBLE) $(LOCAL_OPTS) -C $(ANSIBLE_OPTS) $(YAML)
