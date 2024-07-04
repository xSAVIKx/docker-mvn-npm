FROM maven:3.9.8-amazoncorretto-8-al2023

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
    && dnf install git -y \
    && dnf clean all

ENV NODE_VERSION 20.15.0
ENV NVM_VERSION 0.39.7

RUN curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install "${NODE_VERSION}" && \
    nvm alias "default" "${NODE_VERSION}" && \
    nvm use "default"

ENV PATH "/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
