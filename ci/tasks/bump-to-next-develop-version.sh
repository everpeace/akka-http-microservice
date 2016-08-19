#!/bin/sh

VERSION=`cat version/number`-SNAPSHOT
MESSAGE="[Concourse CI] Bump to Next Development Version ($VERSION)"


# repo: target branch to commit
# repo-master: master branch

cd out
shopt -s dotglob
mv -f ../repo/* ./
git remote add -f master ../repo-master
git merge --no-edit master/master
echo "Bump to $VERSION"

// build.sbtのversionを書き換える

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add build.sbt
git commit -m "${MESSAGE}"
