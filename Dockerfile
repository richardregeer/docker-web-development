FROM ubuntu:16.04

LABEL maintainer "rich2309@gmail.com"

RUN apt-get update \
  && apt-get install -y \
    curl \
    mysql-client-5.7 \
    nano \
  && curl -LO https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb \
  && dpkg -i dumb-init_*.deb \
  && apt-get clean \
  && rm -rf /dumb-init_1.2.0_amd64.deb /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV NODE_VERSION 6.10.0
ENV YARN_VERSION 0.21.3

# Copy nodejs info test page
COPY nodeinfo /usr/local/src/nodeinfo

# Install nodejs and yarn
RUN curl -LOk https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
  && tar -C /usr/local --strip-components 1 -xzf node-v$NODE_VERSION-linux-x64.tar.gz \
  && curl -fSL -o yarn.js https://yarnpkg.com/downloads/$YARN_VERSION/yarn-legacy-$YARN_VERSION.js \
  && mv yarn.js /usr/local/bin/yarn \
  && chmod +x /usr/local/bin/yarn \
  && rm -rf /node-v$NODE_VERSION-linux-x64.tar.gz \
  && cd /usr/local/src/nodeinfo \
  && yarn install \
  && yarn cache clean

ENV PHP_VERSION 7.0.16
ENV XDEBUG_VERSION 2_5_1

# Copy phpinfo test page and php configuration
COPY phpinfo /usr/local/src/phpinfo
COPY php.ini /usr/local/etc/php.ini

# Install php, composer and xdebug
RUN curl -o php-$PHP_VERSION.tar.gz -L http://php.net/get/php-$PHP_VERSION.tar.gz/from/this/mirror \
  && tar -C /usr/local/src -xf php-$PHP_VERSION.tar.gz \
  && rm php-$PHP_VERSION.tar.gz \
  && cd /usr/local/src/php-$PHP_VERSION \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    autoconf \
    pkg-config \
    libreadline-dev \
    libxml2-dev \
    libbz2-dev \
    libmcrypt-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libsslcommon2-dev \
    libedit-dev \
    libsqlite3-dev \
  && ./configure \
    --prefix=/usr/local \
    --mandir=/usr/local/man \
    --with-config-file-path=/usr/local/etc \
    --with-config-file-scan-dir=/usr/local/etc/php.d \
    --disable-cgi \
    --enable-bcmath \
    --enable-cli \
    --enable-ftp \
    --enable-mbstring \
    --enable-pcntl \
    --enable-phar \
    --enable-shared \
    --enable-zip \
    --enable-intl \
    --enable-mysqlnd \
    --with-bz2 \
    --with-curl \
    --with-iconv \
    --with-mcrypt \
    --with-openssl \
    --with-readline \
    --with-gettext \
    --with-mysqli \
    --with-pdo-mysql \
    --with-pdo-sqlite \
    --with-zlib \
  && make \
  && make install \
  && make clean \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && curl -LO https://github.com/xdebug/xdebug/archive/XDEBUG_$XDEBUG_VERSION.tar.gz \
  && tar -xzf XDEBUG_$XDEBUG_VERSION.tar.gz \
  && rm -rf xdebug-XDEBUG_$XDEBUG_VERSION.tar.gz \
  && cd xdebug-XDEBUG_$XDEBUG_VERSION \
  && phpize \
  && ./configure --enable-xdebug \
  && make \
  && make install \
  && cp modules/xdebug.so /usr/local/lib/php/extensions/ \
  && make clean \
  && apt-get clean \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false build-essential autoconf pkg-config \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# Expose the ports for node and php info server.
EXPOSE 8000 8001

WORKDIR /development

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
