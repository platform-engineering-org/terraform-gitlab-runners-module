# gitlab-ci-runners

## What is enabled

| Badge                   | Description          | Service      |
| ----------------------- | -------------------- | ------------ |
| ![Renovate][1]          | Dependencies         | Renovate     |
| ![Pre-commit][2]        | Static quality gates | pre-commit   |
| ![Devcontainer][3]      | Local DEV Env        | devcontainer |

<!-- | ![GitHub Codespaces][4] | Remove DEV Env       | codespaces   | -->

## Dev Environment

The development environment is implemented with [devcontainer][5].

Spin environment:

Run the dev container with the [VSCode extention][6] or the [devcontainer cli][7]

```shell
make up
```

Wait until all pods are up and running. Before that you won't be able to access gitlab.
Sometimes it takes 15-20 mins.

You can monitor the pods status via:

```shell
kubectl get pods -w
```

Once the pods are running, run:

```shell
minikube ip
```

Open this URL in your browser, use the IP from the previous command:

```shell
https://gitlab.[minikube ip].nip.io/
```

Get the password to login:

```shell
kubectl get secret gitlab-gitlab-initial-root-password \
-ojsonpath='{.data.password}' | base64 --decode ; echo
```

Destory environment:

```shell
make down
```

* Note: The deployment is not yet accessible when running in a dev-container.

[1]: https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovate
[2]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[3]: https://img.shields.io/static/v1?label=devcontainer&message=enabled&logo=visualstudiocode&color=007ACC&logoColor=007ACC
[4]: https://img.shields.io/static/v1?label=codespaces&message=enabled&logo=github
[5]: https://code.visualstudio.com/docs/devcontainers/containers
[6]: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
[7]: https://code.visualstudio.com/docs/devcontainers/devcontainer-cli
