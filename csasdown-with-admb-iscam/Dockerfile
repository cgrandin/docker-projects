# Dockerfile for csasdown with admb and iscam executables included

FROM cgrandin/admb as admb
RUN admb

FROM cgrandin/csasdown:latest

COPY --from=admb /usr/bin/admb /usr/bin/admb
COPY --from=admb /usr/bin/gfiscam /usr/bin/gfiscam

WORKDIR /home/rstudio

