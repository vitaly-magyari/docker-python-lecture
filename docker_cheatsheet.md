


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



## Run a container:
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
`--tty, -t`
`--name`
`--rm`
`--volume, -v`
`--workdir, -w`

## Debugging & cleanup
### Open an interactive shell in a container

#### Start a container with a shell:
```
docker run -it (--entrypoint) /bin/sh IMAGE
```
* `--entrypoint` required if image has `ENTRYPOINT` defined, otherwise the command, e.g. /bin/bash will be passed as a argument to entrypoint command, e.g. will be read as `python app.py /bin/sh` in the example container
* `/bin/sh` is a default shell in linux, can also try `/bin/bash`

---
#### Open shell in a running container:
```
docker exec -it /bin/sh CONTAINER_ID/CONTAINER NAME
```
---
<br>

### View running containers:
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