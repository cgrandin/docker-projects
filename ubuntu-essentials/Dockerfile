FROM rocker/r-ubuntu:22.04
RUN apt update && apt  -y --no-install-recommends install \
    build-essential \
    # `flex` is needed for the ADMB compilation
    flex \
    git
