# Docker Mist.io Container

A Dockerfile to create a [Docker](http://docker.io) Container with the latest [mist.io](https://mist.io) Version installed.

More Information about **mist.io** can be found [here](https://mist.io).

## Installation

```bash
$ git clone https://github.com/rolikeusch/docker-mistio.git
$ cd docker-mistio
$ docker build --t="mistio" --rm --no-cache .

(--rm = Remove intermediate containers after a successful build and --no-cache = Do not use cache when building the image)
```
## Usage
Start a new instance with [mist.io](https://mist.io):

```bash
$ docker run -i -t -p 6543:6543 -d mistio

(-i = Keep stdin open even if not attached, -t = Allocate a pseudo-tty, -p = Publish a container's port to the host and -d = Run container in the background, print new container id
```

You can now access your mist.io Installation with the following URL:

```
http://<docker host ip>:6543
```
<br />
<br />

**Attention**: If you start your mist.io Instance that way, **everyone** can access your saved Server(s) and SSH Key(s)!
