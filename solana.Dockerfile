FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"] 
ENV TZ=Australia/Syendy DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install curl -y
RUN apt install build-essential -y
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN source $HOME/.cargo/env
RUN rustup component add rustfmt
RUN apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang cmake make libprotobuf-dev protobuf-compiler -y
RUN apt-get install git -y
WORKDIR /app
RUN git clone https://github.com/solana-labs/solana.git
WORKDIR /app/solana
RUN ./scripts/cargo-install-all.sh --validator-only .
ENV PATH="/solana"/bin:"$PATH"
RUN cargo install solana-cli --version 1.11.11
