#!/bin/sh

VERSION=`cat version/number`${VERSION_POSTFIX}
MESSAGE="${MESSAGE:-[Concourse CI] Bump Version (${VERSION})}"
DISABLE_CI_SKIP=${DISABLE_CI_SKIP:-false}
if [ "${DISABLE_CI_SKIP}" = "true" ]; then
  MESSAGE="[ci skip]${MESSAGE}"
fi
VERSION_FILE="version.sbt"

cd out-version
if [ -e number ]; then
  rm number
fi
echo ${VERSION} > number
cd ..

cd out
shopt -s dotglob
rm -rf *
mv -f ../repo/* ./

echo "Bump to ${VERSION}"
sed -i.bak -e "s/version := \".*\"/version := \"${VERSION}\"/" "${VERSION_FILE}"
rm "${VERSION_FILE}".bak

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add "${VERSION_FILE}"
git commit -m "${MESSAGE}"
