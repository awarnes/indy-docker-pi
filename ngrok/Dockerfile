FROM alpine:latest

LABEL maintainer="Alex Warnes <alexander.warnes@gmail.com>"

ARG arch

ENV USER root
ENV HOME /root

RUN set -ex \
  && apk add --no-cache --virtual .build-deps wget \
  && apk add --no-cache ca-certificates \
  \
  && cd /tmp \
    && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-$arch.zip \
  && unzip ngrok-stable-linux-$arch.zip \
  && install -v -D ngrok /bin/ngrok \
  && rm -f ngrok-stable-linux-$arch.zip ngrok \
  \
  && apk del .build-deps

# Add config script.
COPY ngrok.yml $HOME/ngrok.yml
COPY entrypoint.sh /bin/entrypoint.sh

ENTRYPOINT [ "/bin/entrypoint.sh" ]