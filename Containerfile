ARG BASE_IMAGE="quay.io/fedora/fedora-bootc"
ARG FEDORA_VERSION="${FEDORA_VERSION:-40}"
ARG FEDORA_EDITION="${FEDORA_EDITION:-silverblue}"

FROM ${BASE_IMAGE}:${FEDORA_VERSION}

ARG FEDORA_VERSION
ARG FEDORA_EDITION

COPY scripts/ /tmp/scripts
COPY packages.json /tmp/packages.json

RUN chmod +x /tmp/scripts/*.sh /tmp/scripts/_${FEDORA_EDITION}/*.sh && \
    /tmp/scripts/setup.sh --version ${FEDORA_VERSION} --base ${FEDORA_EDITION} && \
    /tmp/scripts/cleanup.sh --version ${FEDORA_VERSION} --base ${FEDORA_EDITION}
