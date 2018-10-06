FROM alpine:latest
LABEL creator="Werner Beroux <werner@beroux.com>"
LABEL help-from="Fletcher Nichol <fnichol@nichol.ca>"
LABEL maintainer="Alex Warnes <alexander.warnes@gmail.com>"

ENV USER root
ENV HOME /root

RUN set -ex \
  && apk add --no-cache --virtual .build-deps wget \
  && apk add --no-cache ca-certificates \
  \
  && cd /tmp \
    && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
  && unzip ngrok-stable-linux-amd64.zip \
  && install -v -D ngrok /bin/ngrok \
  && rm -f ngrok-stable-linux-amd64.zip ngrok \
  \
  && apk del .build-deps
  #     # Create non-root user.
  # && adduser -h /home/ngrok -D -u 6737 ngrok

# Add config script.
ADD ngrok.yml $HOME/ngrok.yml
ADD entrypoint.sh /

EXPOSE 4040

ENTRYPOINT ["/entrypoint.sh"]
