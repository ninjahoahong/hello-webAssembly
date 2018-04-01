# Use an official ubuntu 18.04
FROM ubuntu:18.04

# Install package dependencies.
RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    curl \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install rust nightly and wasm32
# https://www.hellorust.com/setup/wasm-target/
RUN curl -L https://sh.rustup.rs | sh -s -- -y --default-toolchain=nightly
ENV PATH=$PATH:~/.cargo/bin

RUN ~/.cargo/bin/cargo search
RUN ~/.cargo/bin/rustup update
RUN ~/.cargo/bin/rustup target add wasm32-unknown-unknown --toolchain nightly

RUN ~/.cargo/bin/cargo install --git https://github.com/alexcrichton/wasm-gc

# Expose port 8081
EXPOSE 8081

# Set the working directory to 
WORKDIR /usr/src/hello-webAssembly
