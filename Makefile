.PHONY: up up-ci down

up:
	minikube start
	helm repo add gitlab https://charts.gitlab.io
	helm install --namespace default gitlab-runner -f values.yaml gitlab/gitlab-runner

up-ci:
	minikube start
	helm repo add gitlab https://charts.gitlab.io
	helm install --namespace default gitlab-runner \
		--set gitlabUrl=${GITLAB_URL},runnerRegistrationToken=${RUNNER_REGISTRATION_TOKEN} \
		gitlab/gitlab-runner
down:
	helm uninstall --namespace default gitlab-runner
	minikube stop
