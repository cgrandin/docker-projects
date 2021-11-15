# Dockerfile for Ubuntu with c++ compiler, make and other build-essentials and git

FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y --no-install-recommends && \
    apt-get install -y build-essential git flex

RUN useradd -m container
