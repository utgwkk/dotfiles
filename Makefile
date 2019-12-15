YAML=default.yml
PYTHON=python3
VENV_DIR=./venv
PIP=$(VENV_DIR)/bin/pip
ANSIBLE=$(VENV_DIR)/bin/ansible-playbook
LOCAL_OPTS=-c local -i localhost,
ANSIBLE_OPTS=-D

default: dry-run

.PHONY: create-venv
create-venv:
	[ -d "$(VENV_DIR)" ] || $(PYTHON) -m venv $(VENV_DIR)

.PHONY: pip-install
pip-install: create-venv
	$(PIP) show ansible > /dev/null || $(PIP) install ansible

.PHONY: apply
apply: pip-install
	$(ANSIBLE) $(LOCAL_OPTS) $(ANSIBLE_OPTS) $(YAML)

.PHONY: dry-run
dry-run: pip-install
	$(ANSIBLE) $(LOCAL_OPTS) -C $(ANSIBLE_OPTS) $(YAML)
