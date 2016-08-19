#!/bin/bash

cd repo

# あとでかく
# kubectl set-cluster target --server=${KUBE_SERVER}
# kubectl set-context target --cluster=target --user=deployuser
# kubectl set-credential deployuser --username=${KUBE_USER} --password=${KUBE_PASS}
# kubectl config use-context target
# target_tag=$(sbt docker:version | tail -1 | cut -d' ' -f 2)
# このtagをどうやって渡す？ sedで置換する？
# kubectl create -f ${MANIFEST_PATH}

echo "deploy $(sbt docker:version | tail -1 | cut -d' ' -f 2) to $KUBE_SERVER"
exit 0;
