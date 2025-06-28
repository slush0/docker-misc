# Compile Bitcoin Core from source
FROM debian:stable-slim AS build

# Install & update base system
RUN apt-get update && apt-get upgrade -y

# Install git and build tools
#RUN apt-get install -y git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev bsdmainutils libzmq3-dev
RUN apt-get install -y git build-essential cmake pkgconf python3 libboost-all-dev libssl-dev libzmq3-dev libsqlite3-dev

ENV BITCOIND_VERSION=v29.0

# Clone bitcoind
RUN git clone -b $BITCOIND_VERSION https://github.com/bitcoin/bitcoin.git /bitcoin-git

# Compile bitcoind
WORKDIR /bitcoin-git
RUN cmake -B build -DWITH_ZMQ=ON
RUN cmake --build build
RUN strip /bitcoin-git/build/bin/bitcoind
RUN strip /bitcoin-git/build/bin/bitcoin-cli

# ---------------------
FROM debian:stable-slim
COPY --from=build /bitcoin-git/build/bin/bitcoind /usr/bin/
COPY --from=build /bitcoin-git/build/bin/bitcoin-cli /usr/bin/

RUN apt-get update && apt-get install -y libzmq3-dev libsqlite3-dev libevent-dev

ENV USER_ID=1000

EXPOSE 8332
EXPOSE 8333
EXPOSE 18332
EXPOSE 18333

VOLUME /data
WORKDIR /data

CMD ["bitcoind", "-datadir=/data"]

