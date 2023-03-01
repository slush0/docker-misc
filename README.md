docker-misc
===========

Contains Dockerfile for various applications which I find useful.

bitcoin
-------

Bitcoin Core in Docker

* Run "docker build -t bitcoin docker/" to generate proper image
* Run "./start.sh" to start bitcoind in container
* Run "./stop.sh" to stop container at anytime
* Run "./bitcoin-cli -getinfo" and use bitcoind as usual.
