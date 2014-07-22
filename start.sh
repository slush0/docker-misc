#!/bin/bash

docker run -t --cidfile=bitcoind.cid \
	-v $(pwd)/data:/.bitcoin \
        -p 8333:8333 \
        -p 8332:8332 \
	-d bitcoind $*
