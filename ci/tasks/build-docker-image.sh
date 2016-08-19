#!/bin/bash

cd repo

# sbt \
#     -DTEST_TIME_FACTOR=10 \
#     -Dsbt.boot.directory=../sbt-ivy-cache/rootfs/opt/boot \
#     -Dsbt.ivy.home=../sbt-ivy-cache/rootfs/opt/ivy \
#     -Ddocker_repository=${DOCKER_REGISTORY:-index.docker.io}
#     docker:publish

echo "build docker and publish"
exit 0
