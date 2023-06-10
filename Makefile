.PHONY: infra app up down

infra:
	minikube start
	helm repo add gitlab https://charts.gitlab.io

app:
	helm install --namespace default gitlab-runner -f values.yaml gitlab/gitlab-runner

up: infra app

down:
	helm uninstall --namespace default gitlab-runner
	minikube stop
