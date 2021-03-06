# Docker image for desktop app builds.
FROM circleci/golang:1.14

RUN set -ex \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
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
    && git clone --single-branch --depth=1 --branch 1.24.0-7.0.pre https://github.com/flutter/flutter ~/flutter \
    # Install hover-shim.
    && GO111MODULE=on go get -u -a github.com/worldr/hover-shim \
    # Remove lots of unnecessary stuff.
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt --purge remove -y .\*-doc$ \
    && sudo apt clean -y \
    && sudo apt autoclean -y \
    && sudo apt autoremove -y
