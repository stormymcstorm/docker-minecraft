#!bin/bash

# get mc server
if [[(! -e /data/$MINECRAFT_SERVER_FILE)]]; then
  cp /tmp/$MINECRAFT_SERVER_FILE /data/$MINECRAFT_SERVER_FILE
fi

# if no eula
if [[(! -e /data/eula.txt) && ($MINECRAFT_SERVER_TYPE != "edu")]]; then
 echo "# Generated via Docker on $(date)" > /data/eula.txt
 echo "eula=true" >> /data/eula.txt
fi

cd $MINECRAFT_SERVER_LOCATION

java -Xmx$MINECRAFT_MEM -Xms$MINECRAFT_MEM -jar $MINECRAFT_SERVER_FILE nogui