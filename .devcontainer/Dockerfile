FROM debian:sid

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        binfmt-support \
        build-essential \
        clang \
        cmake \
        debhelper \
        g++-x86-64-linux-gnu \
        git \
        libc-bin \
        libssl-dev \
        lld \
        llvm \
        ninja-build \
        pkgconf \
        python3 \
        python3-clang \
        python3-setuptools \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang
ENV CXX=clang++
