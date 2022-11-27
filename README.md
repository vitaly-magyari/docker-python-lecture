- [Build image:](#build-image)
  - [Parameters:](#parameters)
  - [Options:](#options)
- [Run a container:](#run-a-container)
  - [Parameters:](#parameters-1)
  - [Options:](#options-1)
- [Debugging \& cleanup](#debugging--cleanup)
  - [Open an interactive shell in a container](#open-an-interactive-shell-in-a-container)
    - [Start a container with a shell:](#start-a-container-with-a-shell)
    - [Open shell in a running container:](#open-shell-in-a-running-container)
  - [View running containers:](#view-running-containers)
  - [View local images](#view-local-images)
  - [View local containers](#view-local-containers)
  - [View running processes in container:](#view-running-processes-in-container)
  - [View logs of a running container:](#view-logs-of-a-running-container)
  - [Remove stopped containers](#remove-stopped-containers)
  - [Remove unused images](#remove-unused-images)


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
`IMAGE[:TAG]` - image to create the container from
`COMMAND` - command to be run in the container \
`[ARG..]` - arguments to the command

### Options:
```
docker run \
-it --entrypoint='/bin/bash' \
-w "/my_app_dir" \
--env MY_VAR="myvalue" \
--name=my-cool-container \
-v $(pwd):/my_app_dir \
python:3.10.8-slim-buster
```
```
docker run \
-d \
--name=auto_delete \
--rm \
python:3.10.8-slim-buster
```
`--detach, -d` - run in the background \
`--entrypoint` - default app to launch in the container, overrides `ENTRYPOINT` directive \
`--env, -e` - set an environment variable inside the container \
`--env-file` - set environment variables inside the container from a file \
`--interactive, -i`, `--tty, -t` - usually used together as `-it` to attach a terminal session to a container \
`--name` - specify a name of the container to be run from the IMAGE, if not specified will be generated automatically \
`--rm` - remove container after it stops, if run used again a new container will be created from the same image, `--interactive` flag might block it \
`--volume, -v` - attach a mounted volume, an external file system, to the container. To attach working directory (that you use `docker run` in): -v $(pwd):/my_app_dir \
`--workdir, -w` - default working directory inside the container, overrides `WORKDIR` directive, path must be absolute

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

### View local images
```
docker images
docker image ls
```
---
<br>

### View local containers

```
docker ps
docker container ls
```
---
<br>

### View running processes in container:
```
docker top <container id>/<container name>
```
---
<br>

### View logs of a running container:
```
docker logs <container id>/<container name>
```
---
<br>

### Remove stopped containers
```
docker container prune
```
---

### Remove unused images
```
docker image prune
```