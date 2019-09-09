FROM node:9.11.2
RUN apt-get update && apt-get install -y git curl tar
RUN mkdir factorioClusterio

RUN git clone -b 1.2.x https://github.com/clusterio/factorioClusterio.git && cd factorioClusterio && npm install --only=production
RUN cd factorioClusterio && curl -o factorio.tar.gz -L https://www.factorio.com/get-download/latest/headless/linux64 && tar -xf factorio.tar.gz

WORKDIR factorioClusterio
RUN mkdir instances sharedMods
RUN cp config.json.dist config.json

RUN node client.js download
RUN node ./lib/npmPostinstall.js

LABEL maintainer "trigrab@gmail.com"

EXPOSE 8080 34167

RUN mv sharedPlugins sharedPluginsDist && mkdir sharedPlugins

COPY entrypoint.sh /factorioClusterio/

ENTRYPOINT ["/factorioClusterio/entrypoint.sh"]

CMD "RCONPORT=\"$RCONPORT\" FACTORIOPORT=\"$FACTORIOPORT\" MODE=\"$MODE\" node $MODE\.js start $INSTANCE"
