FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget pwgen

ARG RPC_USER
ARG RPC_PASSWORD
ENV RPC_USER ${RPC_USER:-pact}
# Create a random password if the user doesn't set one
ENV RANDOM_PASS `pwgen -Bs1 12`
ENV RPC_PASSWORD ${RPC_PASSWORD:-$RANDOM_PASS}

# Build the project
RUN wget https://github.com/pact-works/pactcoin/releases/download/v1.1.2/pactcoin-1.1.2-x86_64-linux-gnu.tar.gz -O pact-1.1.2.tar.gz
RUN tar -xvf pact-1.1.2.tar.gz
RUN mkdir -p /root/.pact/
RUN echo "rpcuser=$RPC_USER\nrpcpassword=$RPC_PASSWORD" > /root/.pact/pact.conf

EXPOSE 12877 12876

WORKDIR /pactcoin-1.1.2/bin
CMD ["/pactcoin-1.1.2/bin/pactd"]

