# https://github.com/hardwario/bch-gateway

FROM python:3-slim

VOLUME /tmp

# Dependencies
RUN pip3 install -U setuptools bcg
RUN mkdir /bcg

USER root
WORKDIR /bcg

COPY start.sh /bcg/
RUN chmod +x /bcg/start.sh

CMD ["/bcg/start.sh"]
