docker-mvn-npm
--------------

Docker images that blend official Maven Docker images with LTS Node.js releases, designed for CI/CD pipelines that need to build both Java/Maven and Node.js applications in a single container.

Docker Hub: https://hub.docker.com/r/xsavikx/docker-mvn-npm

## Available Images

| Tag                  | Java               | Maven  | Node.js |
|----------------------|--------------------|--------|---------|
| `java8-mvn3-node24`  | Amazon Corretto 8  | 3.9.14 | 24.15.0 |
| `java11-mvn3-node24` | Amazon Corretto 11 | 3.9.14 | 24.15.0 |
| `java17-mvn3-node24` | Amazon Corretto 17 | 3.9.14 | 24.15.0 |

Each image is also tagged with the full and short Git SHA at build time:
`xsavikx/docker-mvn-npm:<VERSION>-<GIT_SHA>`

## Usage

```dockerfile
FROM xsavikx/docker-mvn-npm:java17-mvn3-node24
```

## Building Locally

```bash
# Build all variants
./build-all.sh

# Build a single variant
./start-build.java8.sh
./start-build.java11.sh
./start-build.java17.sh
```
