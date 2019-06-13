# docker-httptunnel

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/dcsunset/httptunnel.svg)](https://hub.docker.com/r/dcsunset/httptunnel)
[![Docker Pulls](https://img.shields.io/docker/pulls/dcsunset/httptunnel.svg)](https://hub.docker.com/r/dcsunset/httptunnel)
[![Docker Stars](https://img.shields.io/docker/stars/dcsunset/httptunnel.svg)](https://hub.docker.com/r/dcsunset/httptunnel)

This repository is the dockerized version for [httptunnel](https://github.com/larsbrinkhoff/httptunnel).

## Install

```
docker pull dcsunset/httptunnel
```

## Usage

### Server Side

For server side, run:

```
docker run -d --name httptunnel httptunnel:latest hts [OPTION]... [HOST:][PORT]
```

The usage of hts can be seen from the original httptunnel man page or run with option `--help`.

For example, 

```
docker run -d --name httptunnel -p 8888:8888 httptunnel:latest hts -w -F localhost:23 8888
```

THe above expamle will set up httptunnel server to listen on port 8888 and forward to localhost:23.

*Note*: The option `-w` is necessary or the docker container will exit instead of running in background.


### Client Side

For client side, run:

```
docker run -d --name httptunnel httptunnel:latest htc [OPTION]... HOST[:PORT]
```

For example,

```
docker run -d --name httptunnel -p 2323:2323 httptunnel:latest htc -w -F 2323 REMOTE_IP:8888
```
The above example will set up httptunnel client to forward localhost:2323 to REMOTE_IP:8888.


## Build

Clone this repository and run:

```
docker build -t httptunnel .
```

## License

MIT License

