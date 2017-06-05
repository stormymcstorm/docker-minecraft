# docker-minecraft [![Docker Stars](https://img.shields.io/docker/stars/stormymcstorm/minecraft-server.svg?style=plastic)](https://hub.docker.com/r/stormymcstorm/minecraft-server/) [![Docker Pulls](https://img.shields.io/docker/pulls/stormymcstorm/minecraft-server.svg?style=plastic)](https://hub.docker.com/r/stormymcstorm/minecraft-server/) [![Docker Automated buil](https://img.shields.io/docker/automated/stormymcstorm/minecraft.svg?style=plastic)]() [![Travis](https://img.shields.io/travis/stormymcstorm/minecraft-server.svg?style=plastic)](https://travis-ci.org/stormymcstorm/minecraft-server)
docker-minecraft is the Git repository for the docker image `stormymcstorm/minecraft-server`. The Docker Hub repository can be found [here](https://hub.docker.com/r/stormymcstorm/minecraft-server/) There are two diffret variants of this container, a vanilla server container or a bukkit server container. Each of the images are taged with the minecraft version and it the server is not a vanilla one it is appened b the name of the variant. ie. `stormymcstorm/minecraft-server:1.11.2-bukkit`.

## Installation
```bash
$ docker pull stormymcstorm/minecraft-server
```

## Basic Usage
```bash
$ docker run -itd --name mc-server -p 25565:25565 -v $(pwd)/server:/data stormymcstorm/minecraft-server
```

This will create a new minecraft server container and expose the nessary ports for minecraft to run. It will also mount the data volume to the host's filesystem so that the server files will presist.

## Enviorment Variables
- `MINECRAFT_MEM` - This envioment variable controlls the amount of memory the server is allowed to use. By default it is set to `1024M`
<br/>
Usage:
```bash
$ docker run -itd --name mc-server -p 25565:25565 --env MINECRAFT_MEM=1024M stormymcstorm/minecraft-server
```

## Controlling the server
To controll the server yousimply need to attach to the container and start issuing commands. To detach without killing the server use the `CTRL-q CTRL-p`  key sequence.
<br/>
Usage:
```bash
$ dockere attach mc-server
```

## License
[MIT License](LICENSE)
