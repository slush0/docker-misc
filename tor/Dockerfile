FROM debian:bullseye-slim 
ARG DIST=bullseye

# Install & update base system
RUN apt update && apt upgrade -y
RUN apt install -y apt-transport-https wget gpg
# cron unattended-upgrades apt-listchanges

RUN echo "deb [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org $DIST main" > /etc/apt/sources.list.d/tor.list
RUN wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg > /dev/null

RUN apt update && apt install -y tor nyx deb.torproject.org-keyring

# ORPort
EXPOSE 9001
# DirPort
EXPOSE 9030
# SOCKS5
EXPOSE 9050

VOLUME /etc/tor
VOLUME /var/lib/tor
VOLUME /var/log/tor

CMD ["tor"]
