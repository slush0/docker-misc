FROM debian:stable-slim

# Install & update base system
RUN apt-get update && apt-get upgrade -y

# Install git and build tools
RUN apt-get install -y git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev bsdmainutils libzmq3-dev

ENV BITCOIND_VERSION v24.0.1
ENV USER_ID 1000
ENV PATH $PATH:/bitcoin-git/src/

# Clone bitcoind
RUN git clone -b $BITCOIND_VERSION https://github.com/bitcoin/bitcoin.git /bitcoin-git

# Compile bitcoind
WORKDIR /bitcoin-git
RUN ./autogen.sh && ./configure --disable-wallet --disable-tests --without-gui
RUN make src/bitcoind && make src/bitcoin-cli
RUN strip /bitcoin-git/src/bitcoind
RUN strip /bitcoin-git/src/bitcoin-cli

EXPOSE 8332
EXPOSE 8333
EXPOSE 18332
EXPOSE 18333

VOLUME /data
WORKDIR /data

CMD ["bitcoind", "-datadir=/data"]

