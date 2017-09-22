FROM ubuntu:16.04

LABEL maintainer "Richard Regeer" \
      email="rich2309@gmail.com"

RUN apt-get update --fix-missing \
  && apt-get install -y \
    curl mysql-client-5.7 postgresql-client sqlite3 vim git bzip2 unzip libzip-dev locales \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV NODE_VERSION 6.11.3
ENV YARN_VERSION 1.0.2

# Install nodejs and yarn and nodejs tools
RUN curl -LOk https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
  && tar -C /usr/local --strip-components 1 -xzf node-v$NODE_VERSION-linux-x64.tar.gz \
  && curl -fSL -o yarn.js https://yarnpkg.com/downloads/$YARN_VERSION/yarn-legacy-$YARN_VERSION.js \
  && mv yarn.js /usr/local/bin/yarn \
  && chmod +x /usr/local/bin/yarn \
  && rm -rf /node-v$NODE_VERSION-linux-x64.tar.gz \
  && yarn global add gulp@3.9.1 \
  && yarn cache clean

# Expose a ports for development.
EXPOSE 3000 

WORKDIR /development