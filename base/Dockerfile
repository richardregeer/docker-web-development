FROM ubuntu:16.04

LABEL maintainer "Richard Regeer" \
      email="rich2309@gmail.com"

ENV DOCKER_VERSION 17.04.0
ENV NODE_VERSION 8.9.4

# Install development tools 
RUN apt-get update --fix-missing \ 
  && apt-get install -y curl \
    apt-transport-https \
    mysql-client-5.7 \ 
    postgresql-client \ 
    sqlite3 \
    redis-tools \
    apache2-utils \
    vim \
    nano \
    git \
    subversion \
    bzip2 \
    zip \
    unzip \
    libzip-dev \
    locales \
    wget \
    libcurl3 \
    libunwind8 \
    libicu55 \
    jq \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*  

# Install node and docker client
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}-ce.tgz \
  && tar xzvf docker-${DOCKER_VERSION}-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && curl -LOk https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
  && tar -C /usr/local --strip-components 1 -xzf node-v$NODE_VERSION-linux-x64.tar.gz \
  && rm -rf /node-v$NODE_VERSION-linux-x64.tar.gz \
  && npm install gulp@3.9.1 -g \
  && npm install uuid@3.1.0 -g \
  && npm cache clean --force \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

WORKDIR /development