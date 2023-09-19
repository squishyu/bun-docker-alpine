#!/bin/sh

if [ -z $BUILD_TARGET ]; then
    BUILD_TARGET="linux/amd64,linux/arm64"
fi

if [ -z $BUN_VERSION ]; then
    BUN_VERSION="latest"
fi

if [ -z $IMAGE_NAME ]; then
    IMAGE_NAME="squishyu/bun-alpine"
fi

if ! command -v docker > /dev/null; then
    echo "build failed: docker not installed!"
fi

docker buildx build --platform="${BUILD_TARGET}" -t squishyu/bun-alpine:"${BUN_VERSION}" . --push --build-arg BUN_VERSION="${BUN_VERSION}"
