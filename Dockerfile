FROM ubuntu:18.04

ARG BITCOIN_VERSION=26.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    gpg \
    gpg-agent \
    dirmngr && \
    \
    wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    tar xfz bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    mv bitcoin-${BITCOIN_VERSION}/bin/* /usr/local/bin/ && \
    rm -rf bitcoin-* /root/.gnupg/ && \
    \
    apt-get remove --purge -y \
    ca-certificates \
    wget \
    gpg \
    gpg-agent \
    dirmngr && \
    apt-get autoremove --purge -y && \
    rm -r /var/lib/apt/lists/*

EXPOSE 8333 8332 18332 18333

COPY ["bitcoind_setup.sh", "/usr/local/bin/"]
COPY ["docker-entrypoint.sh", "/usr/local/bin/"]

ENTRYPOINT ["docker-entrypoint.sh"]