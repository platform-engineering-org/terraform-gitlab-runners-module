.PHONY: up down all clean test

up:
	minikube start
	kubectl create namespace gitlab
	helm repo add gitlab https://charts.gitlab.io
	helm repo update
	helm install gitlab gitlab/gitlab --namespace gitlab --values values.yaml --version v7.1.0

down:
	minikube delete
