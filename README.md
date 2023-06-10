# gitlab-ci-runners

## What is enabled

| Badge                   | Description          | Service      |
| ----------------------- | -------------------- | ------------ |
| ![Renovate][1]          | Dependencies         | Renovate     |
| ![Devcontainer][3]      | Local DEV Env        | devcontainer |

<!-- | ![Pre-commit][2]        | Static quality gates | pre-commit   | -->
<!-- | ![GitHub Codespaces][4] | Remove DEV Env       | codespaces   | -->

## Dev Environment

Spin environment:

```shell
make up
```

Destory environment:

```shell
make down
```

[1]: https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovate
[2]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[3]: https://img.shields.io/static/v1?label=devcontainer&message=enabled&logo=visualstudiocode&color=007ACC&logoColor=007ACC
[4]: https://img.shields.io/static/v1?label=codespaces&message=enabled&logo=github
