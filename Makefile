.PHONY: depend up down

depend:
	ansible-galaxy install -r ./provision/requirements.yml

up:
	crc-cloud create aws --project-name "crc-ocp412" --backed-url file:///. --aws-ami-id "ami-019669c0960dbcf14" --pullsecret-filepath pull-secret.txt --key-filepath id_ecdsa
#	ansible-playbook ./provision/main.yml

down:
	crc-cloud destroy --project-name "crc-ocp412" --backed-url file:///. --provider "aws"
