# Docker image for desktop app builds.
FROM golang/1.15-buster

RUN set -ex \
    DEBIAN_FRONTEND=noninteractive sudo apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y \
        curl \
        git \
        jq \
        libgl1-mesa-dev \
        libssl-dev \
        openssh \
        rpm \
        unzip \
        xorg-dev \
    # Install Flutter BETA via git.
    git clone --single-branch --depth=1 --branch beta https://github.com/flutter/flutter ~/flutter
    ~/flutter/bin/flutter doctor
    # Install hover-shim.
    GO111MODULE=on go get -u -a github.com/worldr/hover-shim
