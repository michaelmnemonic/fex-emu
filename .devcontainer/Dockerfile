FROM debian:sid

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        binfmt-support \
        build-essential \
        clang \
        cmake \
        debhelper \
        git \
        libssl-dev \
        lld \
        llvm \
        ninja-build \
        pkgconf \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang
ENV CXX=clang++
