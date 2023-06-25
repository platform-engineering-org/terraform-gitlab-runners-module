FROM mcr.microsoft.com/devcontainers/base:debian-11

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash \
    && apt-get install -y gitlab-runner=16.1.0
