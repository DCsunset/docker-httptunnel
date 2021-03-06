FROM ubuntu:18.04
LABEL maintainer="DCsunset"

COPY ./httptunnel/larsbrinkhoff-httptunnel-f440dcb.tar.gz /data/src/

RUN set -ex && \
	\
# Install dependencies
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y build-essential autoconf && \
	\
# Compile
	cd /data/src && \ 
	tar -xf /data/src/*.tar.gz --strip 1 && \
	./autogen.sh && \
	./configure && \
	make && \
	make install && \
	\
# Clean
	rm -rf /data && \
	rm -rf /var/lib/apt/lists/*

