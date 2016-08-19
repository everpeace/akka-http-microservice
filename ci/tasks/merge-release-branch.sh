#!/bin/sh

# repo: merge release branch to this
# repo-release: release branch

cd out
shopt -s dotglob
rm -rf *
mv -f ../repo/* ./


git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git remote add -f release ../repo-release

MESSAGE="${MESSAGE:-[ci skip][Concourse CI] Merge branch release into $(git rev-parse --abbrev-ref HEAD)}"
git merge --ff release/release -m "$MESSAGE"
