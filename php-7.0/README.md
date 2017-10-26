# Docker web development PHP 7.0
This container can be used for doing all your php and node web development needs. Like running unit tests, linting, creating coverage reports and running your application.

## Software installed:
 - php 7.0
    - bcmath
    - cli
    - ftp
    - mbstring
    - pcntl
    - phar
    - shared
    - zip
    - intl
    - mysqlnd
    - bz2
    - curl
    - iconv
    - mcrypt
    - openssl
    - readline
    - gettext
    - mysqli
    - pdo-mysql
    - sqlite
    - pdo-pgsql
    - zlib
 - xdebug 2.5.5
 - composer
 - mysql client
 - postgress sql client
 - sqlite3
 - curl
 - node 6.11.3
 - yarn 1.0.2
 - gulp 3.9.1

## Verify php installation
The verify the php installation and get the configuration a container can be started:
```bash
docker run -it --rm -p 8000:8000 -w /usr/local/src/phpinfo richardregeer/web-development:php-7.0 php -S 0.0.0.0:8000
# Open localhost:8000 in your browser.
```
Open the [test page](http://localhost:8000) in your browser

## How to use the container
Use a shared volume from a data container or host volume to share your code and start the program on the container.
Make sure the -rm option is used to destroy the container when it's finished.

```bash
# Start a node application in the container.
docker run -it --rm --volume=</path/to/your/code>:/development richardregeer/web-development:php-7.0 node <your-application.js>

# Start a php web application in the container.
docker run -it --rm --volume=</path/to/your/code>:/development -p 8000:8000 richardregeer/web-development:php-7.0 php -S 0.0.0.0:8000
```

### Start with XDebug
Xdebug needs to connect to the localhost, you need to expose the ip adres of the host so Xdebug can connect.
```bash
# Start a php web application in the container.
docker run -it --rm --add-host docker_host:<ip-of-host> --volume=</path/to/your/code>:/development -p 8000:8000 richardregeer/web-development:php-7.0 php -S 0.0.0.0:8000

# Use this command to see your ip adres
(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | sed -n 1p)
```
You should be able to connect to the Xdebug server now.
