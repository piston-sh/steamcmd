FROM debian:stretch
LABEL maintainer="admin@deniscraig.com"

ENV STEAMCMD_DIR=/steamcmd
ENV STEAM_HOME_DIR=/home/steam

# We need access to i386 arch 32-bit binaries required by srcds_run
COPY debian/sources.list /etc/apt/sources.list
RUN dpkg --add-architecture i386

# Install, update & upgrade packages
# Create user for the server
# This also creates the home directory we later need
# Clean TMP, apt-get cache and other stuff to make the image smaller
RUN apt-get update && apt-get install -y \
    libssl1.0.0:i386 \
    lib32stdc++6 \
    lib32gcc1 \
    gcc-multilib \
    g++-multilib \
    curl && \
    apt-get -y upgrade && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN useradd steam && adduser steam steam
RUN mkdir -p $STEAMCMD_DIR && chown steam:steam $STEAMCMD_DIR
RUN mkdir -p $STEAM_HOME_DIR && chown steam:steam $STEAM_HOME_DIR
USER steam
RUN mkdir -p $STEAM_HOME_DIR/.steam

# Create Directory for SteamCMD
# Download SteamCMD
# Extract and delete archive
RUN cd $STEAMCMD_DIR && \
        curl -o steamcmd_linux.tar.gz "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
        tar zxf steamcmd_linux.tar.gz && \
        rm steamcmd_linux.tar.gz

# Linking libs n ting
RUN ln -s $STEAMCMD_DIR/linux32 $STEAM_HOME_DIR/.steam/sdk32
ENV LD_LIBRARY_PATH=$STEAMCMD_DIR/linux32:$LD_LIBRARY_PATH

ENV PATH=$PATH:$STEAMCMD_DIR:$STEAMCMD_DIR/linux32
VOLUME $STEAMCMD_DIR
WORKDIR $STEAMCMD_DIR
ENTRYPOINT [ "steamcmd" ]
