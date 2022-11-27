#!/bin/bash

IMAGE="dockerize-python:latest"

docker build -t $IMAGE .

docker run -d $IMAGE 