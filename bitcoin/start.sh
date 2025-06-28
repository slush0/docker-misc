#!/bin/bash

docker run --rm --cidfile=bitcoind.cid \
	-v $(pwd)/data:/data \
        -p 8333:8333 \
        -p 8332:8332 \
	-d bitcoin $*
