FROM node:carbon-alpine

RUN apk add --no-cache bash git openssh gcc g++ musl-dev make python2 coreutils 
    
RUN apk add --update rtorrent

# Port 49164 is opening incoming connections from other peers.
# Port 6881 is the DHT port if you wish to use it.
EXPOSE 49164 6881
# Flood UI
# EXPOSE 3000

# install Flood
# RUN mkdir -p /opt && cd /opt && git clone https://github.com/jfurrow/flood.git

# RUN cd /opt/flood && \
#     cp config.template.js config.js && \
#     npm install && npm cache clean --force && \
#     npm run build

# RUN npm install forever -g

COPY rtorrent.rc /root/.rtorrent.rc
COPY start.sh /start.sh

VOLUME ["/data"]
ENTRYPOINT  ["/start.sh"]
