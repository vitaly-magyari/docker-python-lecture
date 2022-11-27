#!/bin/bash

IMAGE="dockerize-python:latest"

docker build -t $IMAGE .

docker run -p 5000:5000 $IMAGE