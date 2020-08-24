# Docker image for desktop app builds.
FROM golang:1.15-buster

RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         curl \
         git \
         jq \
         libgl1-mesa-dev \
         libssl-dev \
         openssh-client \
         openssh-server \
         libssl-dev \
         rpm \
         unzip \
         xorg-dev \
    # Install Flutter BETA via git.
    && git clone --single-branch --depth=1 --branch beta https://github.com/flutter/flutter /flutter \
    # Install hover-shim.
    && GO111MODULE=on go get -u -a github.com/worldr/hover-shim \
    # Remove lots of unnecessary stuff.
    && rm -rf /var/lib/apt/lists/* \
    && apt --purge remove -y .\*-doc$ \
    && apt clean -y \
    && apt autoclean -y \
    && apt autoremove -y
