# Docker web development
This container can be used for doing all your php and node web development needs. Like running unit tests, linting, creating coverage reports and running your application.

## Software installed:
 - php 7.0.16
 - xdebug 2.5.1
 - composer 1.4.1
 - mysql client 5.7
 - curl 7.47.0
 - nano 2.5.3
 - node 6.10.0
 - yarn 0.21.3

# Verify php and node installation
The verify the php installation and get the configuration a container can be started:
```bash
docker run -it --rm -p 8000:8000 -w /usr/local/src/phpinfo web-development php -S 0.0.0.0:8000
# Open localhost:8000 in your browser.
```

The verify the nodejs installation a container can be started:
```bash
docker run -it --rm -p 8001:8001 -w /usr/local/src/nodeinfo web-development node index.js
# Open localhost:8001 in your browser.
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
