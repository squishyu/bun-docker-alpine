# bun-alpine
Script + Dockerfile for building a Docker image based on [node:20-alpine](https://hub.docker.com/_/node/) with [Bun](https://github.com/oven-sh/bun) installed

---

### Description

The official `over/bun` image is based on Debian and doesn't come with nodejs which currently breaks compatibility with certain use cases.

This image is based on Linux Alpine (which is already being used with most Docker builds for [NextJS](https://github.com/vercel/next.js/blob/canary/examples/with-docker/Dockerfile), [Vite](https://dev.to/ysmnikhil/how-to-build-with-react-or-vue-with-vite-and-docker-1a3l), etc.),  
comes with `bun` + `node` and `npm` installed (which is useful for maintaining compatibility in case of issues with Bun)

It also comes with `glibc` installed, which is currently a necessary fix to run Bun on Linux Alpine ([oven-sh/bun#5545](https://github.com/oven-sh/bun/issues/5545#issuecomment-1722461083))

### Usage

#### In a Dockerfile

```Dockerfile
# Pull the latest version
FROM squishyu/bun-alpine:latest
```

Or

```Dockerfile
# Pull a specific Bun version
FROM squishyu/bun-alpine:1.0.2
```

#### CLI

```sh
docker pull squishyu/bun-alpine
```

To enter interactive shell:

```sh
docker run --rm -it --entrypoint sh squishyu/bun-alpine
```
