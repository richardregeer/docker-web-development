# Docker web development Node 8
This container can be used for doing all your node web development needs. Like running unit tests, linting, creating coverage reports and running your application with [nodejs](https://nodejs.org/en/).

## Installed software:
This image contains node 6. For more information about the installed tools see the [readme](../base/README.md) of the base image.

## Verify installation
To verify the node installation:
```bash
docker run -it --rm richardregeer/web-development:node-6 node -v
```

## How to use the container
Use a shared volume from a data container or host volume to share your code and start the program on the container.
Make sure the -rm option is used to destroy the container when it's finished.

Port 3000 is exposed and can be used for development. The default working directory of the image is /development.

```bash
# Start a node application in the container.
docker run -it --rm -v </path/to/your/code>:/development richardregeer/web-development:node-6 node <your-application.js>
```