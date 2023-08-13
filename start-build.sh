#!/usr/bin/env bash

VERSION="mvn-3-node-14"
GIT_SHA=$( git rev-parse HEAD )
SHORT_SHA="${GIT_SHA::7}"
IMAGE_NAME="xsavikx/docker-mvn-npm"
BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
docker build \
  --build-arg "BUILD_DATE=${BUILD_DATE}" \
  --build-arg "REVISION=${GIT_SHA}" \
  --build-arg "VERSION=${VERSION}" \
  --tag "${IMAGE_NAME}:${GIT_SHA}" \
  --tag "${IMAGE_NAME}:${SHORT_SHA}" \
  --tag "${IMAGE_NAME}:${VERSION}" \
  --tag "${IMAGE_NAME}:latest" \
  .
