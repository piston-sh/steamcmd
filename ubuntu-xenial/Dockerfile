FROM 32bit/ubuntu:16.04
LABEL maintainer="denis@piston.sh"

ENV STEAMCMD_DIR=/home/steam/steamcmd
ENV STEAM_USER_DIR=/home/steam

RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libncurses5 \
    net-tools \
    curl && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN useradd steam && adduser steam steam
RUN mkdir -p $STEAM_USER_DIR && chown steam:steam $STEAM_USER_DIR
RUN mkdir -p $STEAMCMD_DIR && chown steam:steam $STEAMCMD_DIR
USER steam
RUN mkdir -p $STEAM_USER_DIR/.steam

# Download SteamCMD
RUN cd $STEAMCMD_DIR && \
        curl -o steamcmd_linux.tar.gz "http://media.steampowered.com/client/steamcmd_linux.tar.gz" && \
        tar zxf steamcmd_linux.tar.gz && \
        rm steamcmd_linux.tar.gz

ENV PATH=$PATH:$STEAMCMD_DIR:$STEAMCMD_DIR/linux32
VOLUME $STEAMCMD_DIR
WORKDIR $STEAMCMD_DIR
ENTRYPOINT [ "steamcmd.sh" ]
