ARG USER_UID=1000
ARG USER_GID=1000
ARG AUDIO_GID=18
FROM ubuntu:18.04

# Updates apt-get lists
RUN echo "Installing packages..." && \
    dpkg --add-architecture i386 && \
    sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y wget curl python python-apt xterm xz-utils zenity libasound2 libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386 libnss3 python3-apt xdg-desktop-portal xdg-desktop-portal-gtk libvulkan1 vulkan-utils mesa-vulkan-drivers libvulkan1:i386 mesa-vulkan-drivers:i386
RUN apt-get install -y curl apt-utils \
	libasound2 libatk-bridge2.0-0 libcairo2 libcups2 libgdk-pixbuf2.0-0 \
	libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 \
	libsecret-1-0 libx11-xcb1 libxcomposite1 libxcomposite1 \
	libxss1 apt-transport-https libxkbfile1 alsa-utils apulse

# Downloads and installs Steam .deb
RUN echo "Installing Steam..." && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb -O /tmp/steam.deb -q && \
    dpkg -i /tmp/steam.deb && \
    rm -rf /tmp/*

# Creates a new user
RUN echo "Creating User..." && \
    useradd -u ${USER_UID} -g ${USER_GID} -ms /bin/bash steam
RUN groupadd -g ${AUDIO_GID} audioh && usermod -aG audio,audioh,video,sudo steam

USER steam
ENV HOME /home/steam
WORKDIR /home/steam
CMD /usr/bin/steam
