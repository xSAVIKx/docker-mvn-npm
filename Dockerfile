FROM maven:3.6.3-amazoncorretto-8

ENV NODE_VERSION 10.21.0
ENV NVM_VERSION 0.35.3

RUN curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install "${NODE_VERSION}"
