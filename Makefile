.PHONY: all clean test

ENV := dev
TERRAGRUNT_CMD = cd live/${ENV} && terragrunt run-all --terragrunt-non-interactive

.PHONY: tf/init
tf/init:
	${TERRAGRUNT_CMD} init -backend-config=backend.hcl

.PHONY: tf/plan
tf/plan:
	${TERRAGRUNT_CMD} plan -out tfplan

.PHONY: tf/graph
tf/graph:
	${TERRAGRUNT_CMD} graph

.PHONY: tf/apply
tf/apply:
	${TERRAGRUNT_CMD} apply

.PHONY: tf/destroy
tf/destroy:
	${TERRAGRUNT_CMD} destroy -terragrunt-log-level debug

.PHONY: up
up:
	minikube start \
    --cpus 4 \
    --memory 8192
	minikube addons enable ingress
	minikube addons enable dashboard
	kubectl create namespace gitlab
	helm repo add gitlab https://charts.gitlab.io
	helm repo update
	helm upgrade --install gitlab gitlab/gitlab \
	--timeout 600s \
	--set global.hosts.domain=$$(minikube ip).nip.io \
	--set global.hosts.externalIP=$$(minikube ip) \
	-f values.yaml

.PHONY: down
down:
	minikube delete
