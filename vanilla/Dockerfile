#######################################################################
# Dockerfile to build minecraft server container images based on java #
#######################################################################

# use java base image (debian with latest jre)
FROM java

MAINTAINER stormymcstorm

################## ENVIORMENT ######################
ENV MINECRAFT_V 1.12
ENV MINECRAFT_MEM 1024M
ENV MINECRAFT_SERVER_LOCATION /data
ENV MINECRAFT_SERVER_FILE minecraft_server.jar

################## INSTALLATION ######################

# download minecraft server
RUN wget -O /tmp/$MINECRAFT_SERVER_FILE \
  https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_V/minecraft_server.$MINECRAFT_V.jar

################## SETUP ######################
RUN useradd -M --uid 1000 minecraft

RUN mkdir /data \
  && chown minecraft:minecraft /data

VOLUME ["/data"]

COPY start.sh /start
RUN chmod +x /start


################## PREP START ######################

EXPOSE 25565

USER minecraft

################## START ######################
ENTRYPOINT ["/start"]