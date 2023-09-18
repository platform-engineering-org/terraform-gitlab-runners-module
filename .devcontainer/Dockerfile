FROM mcr.microsoft.com/devcontainers/python:3.11@sha256:3b4f1dd483824e4870d5f48f628c70ac996d71a94bc680f8a49c26847561b199

USER vscode

WORKDIR /app

COPY requirements.txt ./

RUN  pip install -r requirements.txt
