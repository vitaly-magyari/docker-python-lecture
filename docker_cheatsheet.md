## View running containers:
```
docker ps
```
---
<br>



### View logs of a running container:
```
docker logs <container id>/<container name>
```
---
<br>



## Build image:
```
docker build --tag (-t) <IMAGE NAME>:<IMAGE TAG> PATH[OPTIONS] PATH (| URL | -)
```
### Parameters:
`PATH` - required, path to `Dockerfile`

### Options:

`--tag, -t` - image name & tag
```
docker build -t test-image:latest
```
`--file, -f` - change path and default name of `Dockerfile`
```
docker build -t test-image:latest -f custom/folder/path/Dockerfile .
```
`--build-arg` - set build-time variables (DO NOT persist at container runtime!)

Dockerfile:
```Dockerfile
ARG BASE_IMAGE_TAG=latest
FROM python:${BASE_IMAGE_TAG}
```
Shell:
```
docker build -t my-image:latest --build-arg BASE_IMAGE_TAG=3.7.10-slim-buster
```
---
<br>



## Run container:
```
docker run [OPTIONS] IMAGE[:TAG] [COMMAND] [ARG...]
```
### Parameters:
### Options:
`--detach, -d`
`--entrypoint`
`--env, -e`
`--env-file`
`--interactive, -i`
`--name`
`--rm`
`--tty, -t`
`--volume, -v`
`--workdir, -w`