FROM ubuntu:16.04

LABEL maintainer="Amanda Cooksey <amandamcooksey@gmail.com"

ARG VERSION="2019-03-15"

WORKDIR /tmp

RUN mkdir /workdir

RUN apt update \
  && apt install --yes \
    make \
    g++ \
    wget \
    perl \
  && wget http://research-pub.gene.com/gmap/src/gmap-gsnap-${VERSION}.tar.gz \
  && tar xzvf gmap-gsnap-${VERSION}.tar.gz \
  && cd gmap-${VERSION} \
  && ./configure --prefix=/usr/local/ --with-GMAPDB=/workdir \
  && make \
  && make check \
  && make install \
  && rm -rf /tmp/* \
  && apt remove --purge --yes \
    make \
    g++ \
    wget \
  && apt autoremove --purge --yes



