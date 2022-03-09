#!/bin/bash
# Details: Creates a directory called $PWD/.auth, and attempts to backup any
#          old keys that may have existed previously.
#
# Useage: ./deploy-creds.sh cluster-name

mkdir -p ./auth

rm -rf *.backup
for i in ./auth/*; do mv "$i" "$i.backup"; done

oc get secret -n $1 $1-admin-kubeconfig -o json | jq -r '.data.kubeconfig' | base64 -d > ./auth/$1-admin-kubeconfig
oc get secret -n $1 $1-admin-password -o json | jq -r '.data.password' | base64 -d > ./auth/$1-admin-password