# Example for factorio clusterio mod in docker

## How to start

* copy one of the docker-compose examples to docker-compose.yml
  * there is a master and a slave configuration as well as a comnined version with both of them
* copy the `config.json` from https://github.com/clusterio/factorioClusterio and edit it as described there
  * save it to volumes/config.json
* create an empty file `volumes/master/secret-api-token.txt` 
  * _this is important, otherwise docker will create a folder there_
* if you want to use mods on your server, copy them to volumes/slave/sharedMods
* if you want to use clusterio plugins like PlayerManager, copy them to volumes/master/sharedPlugins __AND__ volumes/slave/sharedPlugins
* start the server with `docker-compose up`

Your factorio server will now run on the standard port. You can access your clusterio page on http://localhost:8080/ or if HOSTNAME is your hostname on http://HOSTNAME:8080/
