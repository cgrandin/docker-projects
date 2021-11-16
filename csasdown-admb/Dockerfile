# Dockerfile for csasdown with admb and iscam executables included

FROM cgrandin/admb as admb
LABEL maintainer = "chris.grandin@gmail.com"

FROM cgrandin/csasdown:latest

COPY --from=admb /usr/bin/admb /usr/bin/admb
COPY --from=admb /usr/bin/gfiscam /usr/bin/gfiscam

ENV INST=/usr/bin
ENV ADMB_HOME=$INST/admb/build/admb
ENV ADMB_AD2CSV=$INST/admb/contrib/ad2csv
ENV ISCAM_BASE=$INST/gfiscam
ENV ISCAM_HOME=$ISCAM_BASE/build/dist/bin
ENV PATH=$ISCAM_BASE:$ISCAM_HOME:$ADMB_AD2CSV:$ADMB_HOME/bin:$HOME:$PATH

WORKDIR /home/rstudio
