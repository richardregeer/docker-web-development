FROM richardregeer/web-development:base

LABEL maintainer "Richard Regeer" \
      email="rich2309@gmail.com"

ENV PHP_VERSION 7.0.29
ENV XDEBUG_VERSION 2_5_5

# Copy phpinfo test page and php configuration
COPY ./phpinfo /usr/local/src/phpinfo
COPY ./php.ini /usr/local/etc/php.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

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
    libpq-dev \
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
    --with-pdo-pgsql \
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

# Expose the ports for php info.
EXPOSE 8000

WORKDIR /development
