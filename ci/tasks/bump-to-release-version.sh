#!/bin/sh

VERSION=`cat version/number`
MESSAGE="[Concourse CI] Release $VERSION"

cd out
shopt -s dotglob
mv -f ../repo/* ./
echo "Bump to ($VERSION)"

// build.sbt内のversionを書き換える

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add build.sbt
git commit -m "${MESSAGE}"
