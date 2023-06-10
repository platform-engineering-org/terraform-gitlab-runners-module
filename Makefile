.PHONY: up down

up:
	minikube start
	helm repo add gitlab https://charts.gitlab.io
	helm install --namespace default gitlab-runner -f values.yaml gitlab/gitlab-runner

down:
	helm uninstall --namespace default gitlab-runner
	minikube stop
