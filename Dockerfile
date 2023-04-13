FROM quay.io/crcont/crc-cloud:v0.0.2

ARG HOME=/root

COPY requirements.txt $HOME

RUN apk add py3-pip make; \
    pip3 install -r $HOME/requirements.txt
