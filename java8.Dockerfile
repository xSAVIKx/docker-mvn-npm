FROM maven:3.9.12-amazoncorretto-8-al2023

ARG VERSION
ARG BUILD_DATE
ARG REVISION

LABEL "org.opencontainers.image.authors"="savik.ne@gmail.com"
LABEL "org.opencontainers.image.created"="${BUILD_DATE}"
LABEL "org.opencontainers.image.version"="${VERSION}"
LABEL "org.opencontainers.image.revision"="${REVISION}"
LABEL "org.opencontainers.image.title"="docker-mvn-npm"
LABEL "org.opencontainers.image.description"="A container that can be used to build apps with Maven and NodeJS"
LABEL "org.opencontainers.image.documentation"="This image is intended to be as CI pipelines build container"

RUN dnf -y update \
    && dnf install git make automake gcc gcc-c++ jq wget -y \
    && dnf clean all

ENV NODE_VERSION=20.19.6
ENV NVM_VERSION=0.40.3

RUN curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install "${NODE_VERSION}" && \
    nvm alias "default" "${NODE_VERSION}" && \
    nvm use "default"

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
