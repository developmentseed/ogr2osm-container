FROM ubuntu:16.04

RUN apt clean
RUN apt update
RUN apt-get update
RUN apt-get install -y gdal-bin python-gdal python-lxml python2.7 git

RUN git clone --recursive https://github.com/pnorman/ogr2osm
WORKDIR ogr2osm