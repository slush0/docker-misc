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

Pushing to Docker Hub

* Run "docker login ..."
* Run "docker build -t slush0/bitcoin:<VERSION>" docker/"
* Run "docker push slush0/bitcoin:<VERSION>"

electrs
-------

Electrum Server in Rust, in Docker

tor
---

Tor relay node

text-generation-webui
---------------------

Text generation web UI. Dockerized https://github.com/oobabooga/text-generation-webui

hardwario-gateway
-----------------

* Run "docker build --network=host -t hardwario-gateway ." to build proper image

Pushing to Docker Hub

* Run "docker login ..."
* Run "docker build --network host -t slush0/hardwario-gateway:latest ."
* Run "docker push slush0/hardwario-gateway:latest"

