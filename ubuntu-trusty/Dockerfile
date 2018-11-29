FROM ubuntu:trusty
LABEL maintainer="admin@deniscraig.com"

ENV STEAMCMD_DIR=/home/steam/steamcmd
ENV STEAM_HOME_DIR=/home/steam

RUN apt-get update && apt-get install -y \
    lib32gcc1 \
    curl && \
    apt-get -y upgrade && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN useradd steam && adduser steam steam
RUN mkdir -p $STEAM_HOME_DIR && chown steam:steam $STEAM_HOME_DIR
RUN mkdir -p $STEAMCMD_DIR && chown steam:steam $STEAMCMD_DIR
USER steam
RUN mkdir -p $STEAM_HOME_DIR/.steam

# Download SteamCMD
RUN cd $STEAMCMD_DIR && \
        curl -o steamcmd_linux.tar.gz "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
        tar zxf steamcmd_linux.tar.gz && \
        rm steamcmd_linux.tar.gz

ENV PATH=$PATH:$STEAMCMD_DIR:$STEAMCMD_DIR/linux32
VOLUME $STEAMCMD_DIR
WORKDIR $STEAMCMD_DIR
ENTRYPOINT [ "steamcmd.sh" ]
