# Docker web development Node 6
This container can be used for doing all your node web development needs. Like running unit tests, linting, creating coverage reports and running your application.

## Software installed:
 - node 6.11.3
 - yarn 1.0.2
 - gulp 3.9.1
 - mysql client
 - postgress sql client
 - sqlite3
 - curl

## Verify installation
The verify the node installation:
```bash
docker run -it --rm richardregeer/web-development:node-6 node -v
```

## How to use the container
Use a shared volume from a data container or host volume to share your code and start the program on the container.
Make sure the -rm option is used to destroy the container when it's finished.

Port 3000 is exposed and can be used for development.

```bash
# Start a node application in the container.
docker run -it --rm --volume=</path/to/your/code>:/development richardregeer/web-development:node-6 node <your-application.js>
```