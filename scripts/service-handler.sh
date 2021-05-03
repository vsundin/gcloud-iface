#!/bin/bash

DEPLOYMENT_NAME="hello-app"
CONTAINER_IMAGE="docker.io/vsundin/simple-web-app"
SERVICE_PORT=80
TARGET_PORT=8080

key=$1

case $key in
    create)

        # Create deployment
        kubectl create deployment ${DEPLOYMENT_NAME} --image=${CONTAINER_IMAGE}

        # Expose deployment
        kubectl expose deployment ${DEPLOYMENT_NAME} --name=${DEPLOYMENT_NAME}-svc --type=LoadBalancer --port ${SERVICE_PORT} --target-port ${TARGET_PORT}
    ;;
    clean)
        kubectl delete deployment ${DEPLOYMENT_NAME}
        kubectl delete svc ${DEPLOYMENT_NAME}-svc
    ;;
esac
