#!/bin/sh

# repo-target: merge target
# repo: current branch
# out: output for push

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"

cd repo-target
TARGET_BRANCH="$(git rev-parse --abbrev-ref HEAD)}"
cd ..

cd repo
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)}"
cd ..

cd out
shopt -s dotglob
mv -rf *
cp -f ../repo/* ./

git remote add -f target ../repo-target

MESSAGE="${MESSAGE:-[ci skip][Concourse CI] Merge branch ${TARGET_BRANCH} into ${CURRENT_BRANCH}}"
git merge --ff target/"${TARGET_BRANCH}" -m "${MESSAGE}"
