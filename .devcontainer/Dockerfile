FROM mcr.microsoft.com/devcontainers/base:debian-11@sha256:51b46ed567a332919ce54ad2a396a916c3c5357abb0cef61bafa66b18a39108e

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash \
    && apt-get install -y gitlab-runner=16.1.0
