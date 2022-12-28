YAML=default.yml
PYTHON=python3
VENV_DIR=./venv
PIP=$(VENV_DIR)/bin/pip
ANSIBLE=$(VENV_DIR)/bin/ansible-playbook
LOCAL_OPTS=-c local -i localhost,
ANSIBLE_OPTS=-D
REMOTE_HOSTS=

default: dry-run

$(VENV_DIR):
	$(PYTHON) -m venv $(VENV_DIR)

$(ANSIBLE): $(VENV_DIR)
	$(PIP) install ansible

.PHONY: pip-install
pip-install: $(ANSIBLE)

.PHONY: apply
apply: pip-install
ifeq ($(REMOTE_HOSTS),)
	$(ANSIBLE) $(LOCAL_OPTS) $(ANSIBLE_OPTS) $(YAML)
else
	$(ANSIBLE) -i $(REMOTE_HOSTS), $(ANSIBLE_OPTS) $(YAML)
endif

.PHONY: dry-run
dry-run: pip-install
ifeq ($(REMOTE_HOSTS),)
	$(ANSIBLE) $(LOCAL_OPTS) -C $(ANSIBLE_OPTS) $(YAML)
else
	$(ANSIBLE) -i $(REMOTE_HOSTS), -C $(ANSIBLE_OPTS) $(YAML)
endif

.PHONY: clean-venv
clean-venv:
	rm -rf $(VENV_DIR)
