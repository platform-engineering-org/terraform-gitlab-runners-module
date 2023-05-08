FROM registry.redhat.io/openshift4/ose-cli-artifacts as os-cli

FROM ghcr.io/crc-org/crc-cloud:latest

COPY --from=os-cli --chmod=700 /usr/bin/oc /usr/bin/oc

ARG HOME=/root

COPY requirements.txt $HOME

RUN microdnf install -y make git; \
    microdnf clean all -y; \
    pip3 install -r $HOME/requirements.txt
