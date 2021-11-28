# Docker script for csasdown containers
#
# This script was based loosely on this Dockerfile:
# https://github.com/rocker-org/rocker-versioned/blob/master/verse/3.6.3.Dockerfile

# Base rocker/tidyverse image https://hub.docker.com/u/rocker/
FROM cgrandin/admb:latest
LABEL maintainer = "chris.grandin@gmail.com"

ENV INST=/usr/bin

COPY install_ss.sh $INST

WORKDIR $INST

RUN ./install_ss.sh

COPY clean_ss $INST/ss

ENV SS_HOME=$INST/ss
ENV PATH=$SS_HOME:$PATH
