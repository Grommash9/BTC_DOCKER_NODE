#!/bin/sh

# This script sets up the base bitcoin.conf file to be used by the bitcoind process. It only has
# an effect if there is no bitcoin.conf file in bitcoind's data directory.
#
# The options it sets can be tweaked by setting environmental variables when creating the docker
# container.
#
set -e

if [ ! -d "/bitcoin" ]; then
  mkdir -p "/bitcoin"
fi

if [ -e "/bitcoin/bitcoin.conf" ]; then
  exit 0
fi

echo "testnet=1" >> "/bitcoin/bitcoin.conf"
echo "maxconnections=25" >> "/bitcoin/bitcoin.conf"

RPC_USER=${RPC_USER:-bitcoinrpc}
RPC_PASSWORD=${RPC_PASSWORD:-$(dd if=/dev/urandom bs=20 count=1 2>/dev/null | base64)}
echo "server=1" >> "/bitcoin/bitcoin.conf"
echo "rpcuser=${RPC_USER}" >> "/bitcoin/bitcoin.conf"
echo "rpcpassword=${RPC_PASSWORD}" >> "/bitcoin/bitcoin.conf"

echo "rpcallowip=0.0.0.0/0" >> "/bitcoin/bitcoin.conf"

[test]
echo "rpcbind=0.0.0.0" >> "/bitcoin/bitcoin.conf"