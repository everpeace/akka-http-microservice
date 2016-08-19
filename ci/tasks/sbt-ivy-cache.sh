#!/bin/sh

cd repo

if [ "$1" == "init" ]; then
	mkdir -p ../sbt-ivy-cache/rootfs/opt/boot
  mkdir -p ../sbt-ivy-cache/rootfs/opt/ivy
fi

sbt \
  -Dsbt.boot.directory=../sbt-ivy-cache/rootfs/opt/boot \
  -Dsbt.ivy.home=../sbt-ivy-cache/rootfs/opt/ivy \
  test:compile

cd ../sbt-ivy-cache
tar -C rootfs -cf rootfs.tar .
mv rootfs.tar ../to-push
