# Dockerfile for Ubuntu with c++ compiler, make and other build-essentials and git

FROM ubuntu:latest
LABEL maintainer = "chris.grandin@gmail.com"

SHELL ["/bin/bash", "-c"]

ENV INST=/usr/bin
# ADMB Environment variables
ENV ADMB_HOME=$INST/admb/build/admb
ENV ADMB_AD2CSV=$INST/admb/contrib/ad2csv
ENV TEXLIVE_HOME=/usr/local/texlive/2023/bin/x86_64-linux
ENV MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man
ENV PATH=$ADMB_AD2CSV:$ADMB_HOME/bin:$SS_HOME:$TEXLIVE_HOME:$HOME:$PATH

RUN apt-get update
RUN apt-get install -y --no-install-recommends && \
    apt-get install -y build-essential git flex

RUN useradd -m container

# Install ADMB
COPY clean_admb $ADMB_HOME
COPY install_admb.sh $INST
WORKDIR $INST
RUN ./install_admb.sh -d
WORKDIR /home/container

# Install the newest TexLive
RUN mkdir tmp_tex
WORKDIR tmp_tex
RUN apt install -y wget
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN zcat < install-tl-unx.tar.gz | tar xf -
# Need to do a little hack to make WROKDIR work with a directory name which
# changes by version and is only known at build time. Rename the directory
# to 'install' directory by creating a bash script on the fly to make the
# directory, then mv the contents of the unknown dir to it so we creating
# call WORKDIR with a known directory name
RUN printf "#!/usr/bin/bash\n" >> mvdir
RUN printf "mv `ls -d */` install" >> mvdir
RUN chmod +x mvdir
RUN ./mvdir

WORKDIR install
RUN perl ./install-tl --no-interaction
# TexLive packages to install
RUN tlmgr update --self

# Install R base
# Install key
WORKDIR /home/container
RUN mkdir tmp_r_base
WORKDIR tmp_r_base
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | \
gpg --dearmor -o /usr/share/keyrings/r-project.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] \
    https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | \
tee -a /etc/apt/sources.list.d/r-project.list
RUN apt update
RUN apt install -y --no-install-recommends r-base
# Install R packages needed for the hake assessment
RUN ./install_r_packages.R

# Install RStudio
# Install two helper packages we need
RUN apt update
RUN apt install --no-install-recommends software-properties-common dirmngr
# Add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | \
sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# Add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu \
    $(lsb_release -cs)-cran40/"
RUN apt install -y --no-install-recommends r-base

# Install VSCode
WORKDIR /home/container
RUN mkdir tmp_vscode
WORKDIR tmp_vscode
RUN apt update
RUN apt install apt-transport-https wget -y
# Import key
RUN wget -O- https://packages.microsoft.com/keys/microsoft.asc | \
gpg --dearmor | tee /usr/share/keyrings/vscode.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] \
    https://packages.microsoft.com/repos/vscode stable main" | \
tee /etc/apt/sources.list.d/vscode.list
RUN apt update -y
RUN apt install code

# Clone the hake repository
WORKDIR /home/container
RUN git clone https://github.com/pacific-hake/hake-assessment hake
WORKDIR hake

# Install SS3
COPY install_ss.sh $INST
COPY clean_ss3 $INST/ss3
ENV SS_HOME=$INST/ss3
ENV PATH=$SS_HOME:$PATH

# Install R packages needed for the hake assessment
RUN Rscript -e "source('docker/install_r_packages.R')"

