FROM registry.access.redhat.com/ubi9:9.1.0-1782

COPY .tool-versions /root/

ENV ASDF_VERSION=v0.11.3

RUN dnf install -y \
    git && \
    dnf clean all -y && \
    git clone https://github.com/asdf-vm/asdf.git /root/.asdf --branch "${ASDF_VERSION}" --depth 1 && \
    . /root/.asdf/asdf.sh && \
    asdf plugin-add helm && \
    asdf install
