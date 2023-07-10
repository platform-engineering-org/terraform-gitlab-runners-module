FROM mcr.microsoft.com/devcontainers/base:debian-11@sha256:628547ebe81167cad8aca96c9c88c3ad868e8cc8e34d394b740b8bb8f50a452f

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash \
    && apt-get install -y gitlab-runner=16.1.0
