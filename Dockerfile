FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN set -e \
      && ln -sf bash /bin/sh

RUN set -eo pipefail \
      && apt-get -y update \
      && apt-get -y install --no-install-recommends --no-install-suggests \
        ca-certificates curl \
      && curl -fsSL https://deb.nodesource.com/setup_current.x | bash - \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y install \
        node-latest-version \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && /usr/bin/npm --global update npm npx \
      && /usr/bin/npm --global install \
        eslint eslint-config-airbnb eslint-plugin-import typescript yarn

ENTRYPOINT ["/usr/bin/npm"]
