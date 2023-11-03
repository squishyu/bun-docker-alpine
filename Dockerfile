FROM node:${NODE_MAJOR:-20}-alpine
# Add dependencies to get Bun working on Alpine
RUN apk --no-cache add ca-certificates wget

# https://github.com/oven-sh/bun/issues/5545
# Install glibc to run Bun
RUN if [[ $(uname -m) == "aarch64" ]] ; \
    then \
    # aarch64
    wget https://raw.githubusercontent.com/squishyu/alpine-pkg-glibc-aarch64-bin/master/glibc-2.26-r1.apk ; \
    apk add --no-cache --allow-untrusted --force-overwrite glibc-2.26-r1.apk ; \
    rm glibc-2.26-r1.apk ; \
    else \
    # x86_64
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk ; \
    apk add --no-cache --allow-untrusted --force-overwrite glibc-2.28-r0.apk ; \
    rm glibc-2.28-r0.apk ; \
    fi

ARG BUN_VERSION
# Install Bun
RUN npm install -g bun@${BUN_VERSION:-latest}

RUN if [[ ! $(uname -m) == "aarch64" ]] ; \
    then \
    rm /usr/local/bin/bun ; \
    ln -s /usr/local/lib/node_modules/bun/node_modules/@oven/bun-linux-x64-baseline/bin/bun /usr/local/bin/bun ; \
    fi