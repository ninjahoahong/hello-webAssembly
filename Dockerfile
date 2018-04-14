# Use an official ubuntu 18.04
FROM ubuntu:18.04

# Install package dependencies.
RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    curl \
    gcc \
    python

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

# Create the working folder
RUN mkdir -p /usr/src/hello-webAssembly

# Set the working directory to 
WORKDIR /usr/src/hello-webAssembly

# ADD the app folder to the current directory
ADD ./app /usr/src/hello-webAssembly

# BUILD web assembly
# RUN ~/.cargo/bin/cargo +nightly build --release --target wasm32-unknown-unknown --verbose (not working ?)
RUN ~/.cargo/bin/rustc +nightly --target wasm32-unknown-unknown -O src/add.rs -o src/add.wasm

# Default run python server (array is for easier parsing)
CMD ["python", "-m", "SimpleHTTPServer", "8081"]