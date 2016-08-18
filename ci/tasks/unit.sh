#!/bin/bash

cd repo

sbt \
    -DTEST_TIME_FACTOR=10 \
    -Dsbt.boot.directory=../sbt-ivy-cache/rootfs/opt/boot \
    -Dsbt.ivy.home=../sbt-ivy-cache/rootfs/opt/ivy \
    test
