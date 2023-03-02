FROM debian:stable-slim

# Install & update base system
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget clang cmake build-essential librocksdb-dev cargo

ENV VERSION=0.9.12
ENV USER_ID=1000
ENV RUST_BACKTRACE=1
ENV DOWNLOAD_URL=https://github.com/romanz/electrs/archive/refs/tags/v$VERSION.tar.gz

# Download
WORKDIR /tmp
RUN wget -O electrs.tgz $DOWNLOAD_URL
RUN tar xf electrs.tgz
RUN rm electrs.tgz
RUN mv electrs* electrs

WORKDIR /tmp/electrs
RUN cargo build --locked --release
RUN mv target/release/electrs /usr/bin/
RUN rm -rf /tmp/electrs
WORKDIR /data

# public API
EXPOSE 50001
# monitoring
EXPOSE 4224

VOLUME /data
VOLUME /bitcoin-ro

ENV ELECTRS_DB_DIR /data
ENV ELECTRS_DAEMON_DIR /bitcoin-ro
ENV ELECTRS_DAEMON_P2P_ADDR bitcoin:8333
ENV ELECTRS_DAEMON_RPC_ADDR bitcoin:8332
ENV ELECTRS_ELECTRUM_RPC_ADDR 0.0.0.0:50001
ENV ELECTRS_MONITORING_ADDR 0.0.0.0:4224
ENV ELECTRS_VERBOSITY 2
ENV ELECTRS_TIMESTAMP 1

CMD ["electrs"]

