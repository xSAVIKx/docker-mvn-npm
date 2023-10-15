#!/usr/bin/env bash

VERSION="${VERSION}"
DOCKERFILE="${DOCKERFILE}"
GIT_SHA=$( git rev-parse HEAD )
SHORT_SHA="${GIT_SHA::7}"
IMAGE_NAME="xsavikx/docker-mvn-npm"
BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
docker build -f "${DOCKERFILE}" \
  --build-arg "BUILD_DATE=${BUILD_DATE}" \
  --build-arg "REVISION=${GIT_SHA}" \
  --build-arg "VERSION=${VERSION}" \
  --tag "${IMAGE_NAME}:${VERSION}-${GIT_SHA}" \
  --tag "${IMAGE_NAME}:${VERSION}-${SHORT_SHA}" \
  --tag "${IMAGE_NAME}:${VERSION}" \
  .
