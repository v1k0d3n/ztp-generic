#!/bin/bash
# Details: Script that polls an active deployment in progress.
# Includes: namespace, state, info, validation, requirements, eventsurl, and more.
#
# Useage: ./deploy-status.sh cluster-name

while true
do
  clear
  oc -n $1 get agentclusterinstalls $1 -o json | jq -C '{"status":{"creationTimestamp": .metadata.creationTimestamp,"clusterID": .spec.clusterMetadata.clusterID,"name": .metadata.name,"namespace": .metadata.namespace,"imageSetRef": .spec.imageSetRef.name,"state": .status.debugInfo.state,"stateInfo": .status.debugInfo.stateInfo,"messages": .status.conditions |  map( { (.type): .message } ) | add,"logsURL": .status.debugInfo.logsURL,"eventsURL": .status.debugInfo.eventsURL}}'
  sleep 5
done