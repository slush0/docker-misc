bitcoind-docker
===============

Bitcoin Core in Docker

* Install Docker (docker.io)
* Run "docker build -t bitcoind docker/" to generate proper image
* (Optional:) tune settings in data/bitcoin.conf
* Run "./start.sh" to start bitcoind in container
* Run "./stop.sh" to stop cointainer anytime
* Run "./bitcoin-cli getinfo" and use bitcoind as usual...

Hints:
* Put "testnet=1" in data/bitcoin.conf to switch to testnet3
