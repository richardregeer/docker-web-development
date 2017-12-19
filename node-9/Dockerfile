FROM richardregeer/web-development:base

LABEL maintainer "Richard Regeer" \
      email="rich2309@gmail.com"

ENV NODE_VERSION 9.3.0

# Install nodejs
RUN curl -LOk https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
  && tar -C /usr/local --strip-components 1 -xzf node-v$NODE_VERSION-linux-x64.tar.gz \
  && rm -rf /node-v$NODE_VERSION-linux-x64.tar.gz
