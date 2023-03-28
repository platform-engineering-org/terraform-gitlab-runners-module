.PHONY: depend up down

depend:
	ansible-galaxy install -r ./provision/requirements.yml

up: depend
	ansible-playbook ./provision/main.yml --tags up

down: depend
	ansible-playbook ./provision/main.yml --tags down
