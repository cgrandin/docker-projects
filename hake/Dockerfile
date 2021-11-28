# Dockerfile for hake for the cloud

FROM rocker/verse:latest
LABEL maintainer = "chris.grandin@gmail.com"

# Install Linux packages required to run INLA
RUN apt-get update -qq && \
    apt-get -y --no-install-recommends install \
    libxt6 \
    tk8.6-dev \
    libgeos-dev \
    libudunits2-dev \
    libgdal-dev \
    libv8-dev \
    libglpk40 \
    cargo

COPY install_packages.R install_packages.R
RUN Rscript install_packages.R
