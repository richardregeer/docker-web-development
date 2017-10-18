FROM ubuntu:16.04

LABEL maintainer "Richard Regeer" \
      email="rich2309@gmail.com"

# Setup packages 
RUN apt-get update --fix-missing \ 
  && apt-get install -y curl apt-transport-https \
  && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list

# Install development tools 
RUN apt-get install -y \
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
    unzip \
    libzip-dev \
    locales \
    wget \
    libcurl3 \
    libunwind8 \
    libicu55 \
  && wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-beta.7/powershell_6.0.0-beta.7-1ubuntu1.16.04.1_amd64.deb -q \
  && dpkg -i powershell_6.0.0-beta.7-1ubuntu1.16.04.1_amd64.deb \ 
  && rm -rf powershell_6.0.0-beta.7-1ubuntu1.16.04.1_amd64.deb \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV NODE_VERSION 6.11.4
ENV YARN_VERSION 1.2.1

# Install nodejs and yarn and nodejs tools
RUN curl -LOk https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
  && tar -C /usr/local --strip-components 1 -xzf node-v$NODE_VERSION-linux-x64.tar.gz \
  && curl -fSL -o yarn.js https://yarnpkg.com/downloads/$YARN_VERSION/yarn-legacy-$YARN_VERSION.js \
  && mv yarn.js /usr/local/bin/yarn \
  && chmod +x /usr/local/bin/yarn \
  && rm -rf /node-v$NODE_VERSION-linux-x64.tar.gz \
  && yarn global add gulp@3.9.1 \
  && yarn global add uuid@3.1.0 \
  && yarn cache clean

# Expose a ports for development.
EXPOSE 3000 

WORKDIR /development