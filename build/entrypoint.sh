#!/bin/bash

# install clusterio into sharedMods in case the user mounts a new volume there
if [ ! -d "sharedMods" ]; then
    mkdir sharedMods
fi
node client.js download

# try to install deault plugins from git, in case the user mounts a new volume there
if [ -d "sharedPlugins" ] && [ "$(ls -A "sharedPlugins")" ]; then
    echo "copy default plugins to actual sharedMods folder" 
    cp -Rv sharedPluginsDist/* sharedPlugins/
else
    echo "no shared plugins volume mounted, copy default plugins"
    mv sharedPluginsDist/* sharedPlugins/
fi

# Hand off to the CMD
bash -c "$*"
