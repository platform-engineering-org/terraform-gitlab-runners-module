FROM mcr.microsoft.com/devcontainers/python:3.11@sha256:95ccb1dbdc6476ac207f6b00963bf38849a7f93c7c2bbabd28ac2c073aa83801

USER vscode

WORKDIR /app

COPY requirements.txt ./

RUN  pip install -r requirements.txt
