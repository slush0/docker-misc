#!/bin/bash

docker stop -t 1 `cat bitcoind.cid`
rm -f bitcoin.cid
