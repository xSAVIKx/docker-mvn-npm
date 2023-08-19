FROM maven:3.9.3-amazoncorretto-8

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

RUN yum update -y && \
    yum install git -y \
    yum clean all

ENV NODE_VERSION 14.21.3
ENV NVM_VERSION 0.39.4

RUN curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install "${NODE_VERSION}" && \
    nvm alias "default" "${NODE_VERSION}" && \
    nvm use "default" && \
    npm i npm@latest --global

ENV PATH "/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
