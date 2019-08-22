#!/bin/bash

#if [ -d "sharedModsVolume" ] && [ -n "$(ls -A "sharedModsVolume")" ]; then
#    echo "copy mods from volume to actual sharedMods" 
#    cp -Rv sharedModsVolume/* sharedMods/
#
#else
#    echo "no shared mods from outside docker"
#fi

# instead of copying this install clusterio to volume
if [ -d "sharedMods" ]; then
    mkdir sharedMods
fi
node client.js download

if [ -d "sharedPlugins" ] && [ -n "$(ls -A "sharedPlugins")" ]; then
    echo "copy plugins from git to actual sharedMods" 
    cp -Rv sharedPluginsDist/* sharedPlugins/
else
    echo "no shared plugins from outside docker"
    mv sharedPluginsDist sharedPlugins
fi

# Hand off to the CMD
bash -c "$*"
