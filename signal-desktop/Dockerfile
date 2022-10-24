FROM ubuntu:16.04
ARG DEBIAN_FRONTEND=noninteractive

# Updates apt-get lists
RUN echo "Installing packages..." && \
    apt-get update && \
    apt-get install -y wget curl python python-apt xterm xz-utils zenity libasound2 libnss3 python3-apt xdg-desktop-portal xdg-desktop-portal-gtk software-properties-common
RUN apt-get install -y curl apt-utils \
	libasound2 libatk-bridge2.0-0 libcairo2 libcups2 libgdk-pixbuf2.0-0 \
	libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 \
	libsecret-1-0 libx11-xcb1 libxcomposite1 libxcomposite1 \
	libxss1 apt-transport-https libxkbfile1 alsa-utils

# Creates a new user
RUN echo "Creating User..." && \
    useradd -u 1001 -ms /bin/bash user
RUN groupadd -g 18 audioh && usermod -aG audio,audioh,video,sudo user

RUN wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg \
	&& cat signal-desktop-keyring.gpg | tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null \
	&& echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | \
	tee -a /etc/apt/sources.list.d/signal-xenial.list
RUN apt update && apt install -y signal-desktop

USER user
ENV HOME /home/user
WORKDIR /home/user
