#!/bin/sh

set -e

bitcoind_setup.sh

echo "################################################"
echo "# Configuration used: /bitcoin/bitcoin.conf    #"
echo "################################################"
echo ""
cat /bitcoin/bitcoin.conf
echo ""
echo "################################################"

exec bitcoind -datadir=/bitcoin -conf=/bitcoin/bitcoin.conf -printtoconsole "$@"