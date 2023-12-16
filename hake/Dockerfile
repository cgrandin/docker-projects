# Dockerfile for Ubuntu with c++ compiler, make and other build-essentials and git

FROM cgrandin/ubuntu-essentials as os
#FROM rocker/r-ubuntu:22.04
LABEL maintainer = "chris.grandin@gmail.com"

SHELL ["/bin/bash", "-c"]

ENV HOME=/home/container
ENV PATH=$HOME:$PATH
ENV INST=/usr/bin

RUN useradd -m container
WORKDIR $HOME

# Install ADMB and set environment variables for it
ENV ADMB_HOME=$INST/admb/build/admb
ENV ADMB_AD2CSV=$INST/admb/contrib/ad2csv
ENV PATH=$ADMB_AD2CSV:$ADMB_HOME/bin:$PATH
COPY clean_admb $ADMB_HOME
COPY install_admb.sh $INST/install_admb.sh
WORKDIR $INST
RUN ./install_admb.sh -d
WORKDIR $HOME
