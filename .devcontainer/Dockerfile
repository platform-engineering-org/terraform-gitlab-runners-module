FROM mcr.microsoft.com/devcontainers/python:3.11@sha256:902177832d72d27f3e39e2a5651a093fba5d371ae0e13070045eaa1e4615e6d7

USER vscode

WORKDIR /app

COPY requirements.txt ./

RUN  pip install -r requirements.txt
