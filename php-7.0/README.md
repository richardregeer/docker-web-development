# Docker web development
This container can be used for doing all your php and node web development needs. Like running unit tests, linting, creating coverage reports and running your application.

# Software installed:
 - php 7.0.20
 - xdebug 2.5.5
 - composer 1.4.2
 - mysql client
 - postgress sql client
 - curl
 - nano
 - node 6.11.1
 - yarn 0.27.5
 - gulp 3.9.1

Dumb-init is installed to ensure the program that is running will recieve the correct signals.

# Verify php installation
The verify the php installation and get the configuration a container can be started:
```bash
docker run -it --rm -p 8000:8000 -w /usr/local/src/phpinfo web-development php -S 0.0.0.0:8000
# Open localhost:8000 in your browser.
```

# How to use the container
Use a shared volume from a data container or host volume to share your code and start the program on the container.
Make sure the -rm option is used to destroy the container when it's finished.

```bash
# Start a node application in the container.
docker run -it --rm --volume=</path/to/your/code>:/development web-development node <your-application.js>

# Start a php web application in the container.
docker run -it --rm --volume=</path/to/your/code>:/development -p 8000:8000 web-development php -S 0.0.0.0:8000
```
