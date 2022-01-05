# Docker script for Stock Synthesis
# Used to produce Docker image cgrandin/ss
# https://hub.docker.com/repository/docker/cgrandin/ss

FROM cgrandin/admb:latest
LABEL maintainer = "chris.grandin@gmail.com"

ENV INST=/usr/bin

COPY install_ss.sh $INST

WORKDIR $INST

RUN ./install_ss.sh

COPY clean_ss $INST/ss

ENV SS_HOME=$INST/ss
ENV PATH=$SS_HOME:$PATH
