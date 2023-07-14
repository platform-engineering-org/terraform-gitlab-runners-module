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

Destory environment:

```shell
make down
```

Stop the dev container

[1]: https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovate
[2]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[3]: https://img.shields.io/static/v1?label=devcontainer&message=enabled&logo=visualstudiocode&color=007ACC&logoColor=007ACC
[4]: https://img.shields.io/static/v1?label=codespaces&message=enabled&logo=github
[5]: https://code.visualstudio.com/docs/devcontainers/containers
[6]: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
[7]: https://code.visualstudio.com/docs/devcontainers/devcontainer-cli
