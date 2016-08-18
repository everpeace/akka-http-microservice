#!/bin/sh

# repo: merge release branch to this
# repo-release: release branch

cd out
shopt -s dotglob
mv -f ../repo/* ./
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git remote add -f release ../repo-release
git merge --no-edit release/release
