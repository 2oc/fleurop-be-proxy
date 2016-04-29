#!/bin/bash


oc new-project fleurop-be-proxy \
    --description="Fleurop BE proxy" \
    --display-name="Fleurop BE proxy"

# oc project nptool

echo "proxy"
oc create -f proxy/ImageStream.yaml
oc create -f proxy/BuildConfig.yaml
oc create -f proxy/DeploymentConfig.yaml
oc create -f proxy/Services.yaml
oc start-build proxy
