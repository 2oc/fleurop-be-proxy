#!/bin/bash


oc new-project fleurop-be-proxy \
    --description="BE SSL proxy" \
    --display-name="[fleurop] BE SSL proxy"

# oc project nptool

echo "proxy"
oc create -f proxy/imagestream.yaml
oc create -f proxy/buildconfig.yaml
oc create -f proxy/deploymentconfig.yaml
oc create -f proxy/services.yaml
oc start-build proxy

echo "letsencrypt"
oc create -f letsencrypt/imagestream.yaml
oc create -f letsencrypt/buildconfig.yaml
oc create -f letsencrypt/deploymentconfig.yaml
oc create -f letsencrypt/services.yaml
oc create -f letsencrypt/pvc.yaml
