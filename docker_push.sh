#!/bin/bash

source .env

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

IMAGE="vayumagyari/hello-python-k8s:latest"

docker build -t $IMAGE .
docker push $IMAGE