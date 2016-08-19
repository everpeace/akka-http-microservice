#!/bin/sh

VERSION=`cat version/number`-SNAPSHOT
MESSAGE="[ci skip][Concourse CI] Bump to Next Development Version ($VERSION)"


# repo: target branch to commit
# repo-master: master branch

cd out
shopt -s dotglob
mv -f ../repo/* ./

if [ ! "$1" = "no_merge_master" ]; then
  git remote add -f master ../repo-master
  MERGE_MESSAGE=${MESSAGE:-[ci skip][Concourse CI] Merge branch 'master' into $(git rev-parse --abbrev-ref HEAD)}
  git merge --ff master/master -m $MERGE_MESSAGE
fi

echo "Bump to $VERSION"
sed -i.bak -e "s/version := \".*\"/version := \"$VERSION\"/" build.sbt
rm build.sbt.bak

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add build.sbt
git commit -m "${MESSAGE}"
