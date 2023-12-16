# Dockerfile for building an image containing admb, ad2csv and all linkages

FROM cgrandin/ubuntu-essentials:latest
LABEL maintainer = "chris.grandin@gmail.com"

SHELL ["/bin/bash", "-c"]

ENV INST=/usr/bin
ENV ADMB_HOME=$INST/admb/build/admb
ENV ADMB_AD2CSV=$INST/admb/contrib/ad2csv
ENV PATH=$ADMB_AD2CSV:$ADMB_HOME/bin:$HOME:$PATH

COPY install_admb.sh $INST

  WORKDIR /usr/bin

RUN ./install_admb.sh -d

COPY clean_admb $ADMB_HOME

WORKDIR /home/container
