#!/bin/bash

cp -u /bitcoin.conf /.bitcoin/bitcoin.conf

if [ "x$*" == "x" ]; then
    echo "Starting bitcoind..." $*

    cat /etc/hosts | head -n1 | cut -f1 > /.bitcoin/node_ip

    /bitcoind-git/src/bitcoind $*

else

    echo "Starting bitcoin-cli, connecting to `cat /.bitcoin/node_ip`..."

    /bitcoind-git/src/bitcoin-cli -rpcconnect=`cat /.bitcoin/node_ip` $*

fi
