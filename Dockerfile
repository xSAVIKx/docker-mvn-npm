FROM maven:3.8.1-amazoncorretto-8

RUN yum update -y && \
    yum clean all && \
    rm -rf /var/cache/yum

ENV NODE_VERSION 12.22.3
ENV NVM_VERSION 0.38.0

RUN curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install "${NODE_VERSION}" && \
    nvm alias "default" "${NODE_VERSION}" && \
    nvm use "default" && \
    npm i npm@latest --global

ENV PATH "/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
