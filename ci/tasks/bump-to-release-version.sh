#!/bin/sh

VERSION=`cat version/number`
MESSAGE="[Concourse CI] Release $VERSION \n (master branch will ignore [ci skip])"

cd out
shopt -s dotglob
mv -f ../repo/* ./
echo "Bump to ($VERSION)"

sed -ibak -e "s/version := \".*\"/version := \"$VERSION\"/" build.sbt
rm build.sbtbak

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add build.sbt
git commit -m "${MESSAGE}"
