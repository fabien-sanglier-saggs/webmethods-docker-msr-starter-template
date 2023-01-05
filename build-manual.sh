#!/bin/sh

BASE_IMAGE="ghcr.io/softwareag-government-solutions/webmethods-microservicesruntime:10.15.0"
BUILD_IMAGE_REPO="ghcr.io/softwareag-government-solutions/"
BUILD_IMAGE_NAME="webmethods-msr-project-name"
BUILD_IMAGE_TAG="1.0.0-10.15.0"

docker build \
    -t ${BUILD_IMAGE_REPO}/${BUILD_IMAGE_NAME}:${BUILD_IMAGE_TAG} \
    -f Dockerfile \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    .

echo "Done!!"
exit 0;