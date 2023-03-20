.PHONY: up down

up:
	podman run --rm \
    -v ${PWD}:/workspace:z \
	-v ~/Downloads/pull-secret.txt:/pullsecret/pull-secret.txt:z \
	-v ~/.aws:/root/.aws:z \
    quay.io/crcont/crc-cloud:v0.0.2 \
	create aws \
        --project-name "crc-ocp412" \
        --backed-url "file:///workspace" \
        --output "/workspace" \
        --aws-ami-id "ami-019669c0960dbcf14" \
        --pullsecret-filepath "/pullsecret/pull-secret.txt" \
        --key-filepath "/workspace/id_ecdsa"

down:
	podman run --rm \
    -v ${PWD}:/workspace:z \
	-v ~/.aws:/root/.aws:z \
    quay.io/crcont/crc-cloud:v0.0.2 destroy \
        --project-name "crc-ocp412" \
        --backed-url "file:///workspace" \
        --provider "aws"
