bitcoind-docker
===============

Bitcoin Core in Docker

* Install Docker (docker.io)
* Run "docker build -t bitcoind docker/" to generate proper image
* (Optional:) tune settings bitcoin.conf in data/bitcoin.conf
* Run "./start.sh" to start bitcoind in container
* Run "./stop.sh" to stop cointainer anytime
* Run "./bitcoin-cli getinfo" and use bitcoind as usual...
