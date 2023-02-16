FROM debian:stable-slim

# Install & update base system
RUN apt-get update && apt-get upgrade -y

# Install git and build tools
RUN apt-get install -y git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev bsdmainutils

ENV BITCOIND_VERSION v24.0.1

# Clone bitcoind
RUN git clone -b $BITCOIND_VERSION https://github.com/bitcoin/bitcoin.git /bitcoind-git
# Compile bitcoind
RUN cd /bitcoind-git && ./autogen.sh && ./configure --disable-wallet --without-gui && make -j4
RUN strip /bitcoind-git/src/bitcoind

ADD bitcoin.conf /
ADD launcher.sh /
ENTRYPOINT ["/launcher.sh"]

