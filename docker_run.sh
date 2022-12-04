#!/bin/bash

IMAGE="vayumagyari/hello-python-k8s:latest"

docker build -t $IMAGE .

docker run -p 5000:5000 \
"$@" \
$IMAGE