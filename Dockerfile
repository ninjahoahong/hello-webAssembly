# Use an official rust image
FROM rust:1.23.0

# Set the working directory to 
WORKDIR /usr/src/hello-webAssembly

COPY . .

CMD [ "hello-webAssembly" ]