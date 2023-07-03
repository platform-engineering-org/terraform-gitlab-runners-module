.PHONY: up down all clean test

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
down:
	minikube delete
