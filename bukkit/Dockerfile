#####################################################################
# Dockerfile to build bukkit server container images based on java #
####################################################################

# use java base image (debian with latest jre)
FROM java

MAINTAINER stormymcstorm

################## ENVIORMENT ######################
ENV MINECRAFT_V 1.11.2
ENV MINECRAFT_MEM 1024M
ENV MINECRAFT_SERVER_LOCATION /data
ENV MINECRAFT_SERVER_FILE minecraft_server.jar

ENV MAVEN_OPTS "-Xmx2G"

################## INSTALLATION ######################

# download spigot build tools
RUN mkdir -p /tmp/build

RUN wget -O /tmp/build/BuildTools.jar \
  https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# build spigot server
RUN cd /tmp/build && java -Xmx2G -jar BuildTools.jar

RUN cd /

RUN cp /tmp/build/spigot-$MINECRAFT_V.jar /tmp/$MINECRAFT_SERVER_FILE
RUN rm -R /tmp/build

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