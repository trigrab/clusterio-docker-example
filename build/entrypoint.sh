#!/bin/bash

if [ -d "sharedModsVolume" ] && [ -n "$(ls -A "sharedModsVolume")" ]; then
    echo "copy mods from volume to actual sharedMods" 
    cp -Rv sharedModsVolume/* sharedMods/

else
    echo "no shared mods from outside docker"
fi
if [ -d "sharedPluginsVolume" ] && [ -n "$(ls -A "sharedPluginsVolume")" ]; then
    echo "copy pluginss from volume to actual sharedMods" 
    cp -Rv sharedPluginsVolume/* sharedPlugins/
else
    echo "no shared plugins from outside docker"
fi

# Hand off to the CMD
bash -c "$*"
