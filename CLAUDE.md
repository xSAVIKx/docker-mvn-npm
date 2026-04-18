# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository builds Docker images that combine official Maven images with LTS Node.js, providing unified CI/CD containers for projects requiring both Java/Maven and Node.js toolchains.

## Build Commands

```bash
# Build all three Java variant images
./build-all.sh

# Build individual variants
./start-build.java8.sh
./start-build.java11.sh
./start-build.java17.sh
```

Each build script sets `VERSION` and `DOCKERFILE` env vars, then calls `start-build.sh`, which:
- Extracts the current Git SHA for reproducible tagging
- Builds and tags the image as `xsavikx/docker-mvn-npm:<VERSION>-<GIT_SHA>`, `<VERSION>-<SHORT_SHA>`, and `<VERSION>`

## Architecture

Three parallel Dockerfiles (`java8.Dockerfile`, `java11.Dockerfile`, `java17.Dockerfile`) follow an identical pattern:

1. Base: `maven:3.9.12-amazoncorretto-<JAVA>-al2023`
2. Install via `dnf`: `git make automake gcc gcc-c++ jq wget` (clean cache after)
3. Install NVM then Node.js `NODE_VERSION` via NVM
4. Set `PATH` to include NVM's Node.js bin directory
5. Apply OCI labels using `BUILD_DATE`, `REVISION`, and `VERSION` build args

## Versioning Convention

Image tags follow the pattern: `java<N>-mvn3-node<MAJOR>` (e.g., `java17-mvn3-node24`).

When updating tool versions, change `ENV NODE_VERSION` / `ENV NVM_VERSION` and the Maven base image tag consistently across **all three Dockerfiles** and the corresponding build scripts. `ARG` is only used for OCI label metadata (`VERSION`, `BUILD_DATE`, `REVISION`).

## Key Variables

| Variable | Current Value | Location |
|---|---|---|
| Maven version | 3.9.14 | Dockerfile `FROM` lines |
| Node.js version | 24.15.0 | `NODE_VERSION` ENV |
| NVM version | 0.40.4 | `NVM_VERSION` ENV |
| Docker Hub repo | `xsavikx/docker-mvn-npm` | `start-build.sh` |
