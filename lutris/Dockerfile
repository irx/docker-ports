FROM archlinux:latest

ARG VIDEO_GID=27
ARG AUDIO_GID=18

RUN printf '[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm \
	lutris \
	mandoc \
	doas \
	wine \
	lib32-mesa \
	mesa \
	nss \
	gnutls \
	lib32-alsa-plugins \
	lib32-gnutls \
	lib32-gstreamer \
	lib32-libgpg-error \
	lib32-libldap \
	lib32-libpulse \
	lib32-mesa \
	lib32-openal \
	lib32-sqlite \
	lib32-vulkan-icd-loader \
	lib32-vulkan-intel \
	lib32-vulkan-radeon \
	samba \
	vulkan-icd-loader \
	vulkan-intel \
	vulkan-radeon \
	vulkan-tools \
	winetricks \
	xf86-video-amdgpu \
	zenity \
	qt5-base
RUN echo 'permit nopass root' > /etc/doas.conf

RUN groupdel video && groupadd -g ${VIDEO_GID} video
RUN groupdel audio && groupadd -g ${AUDIO_GID} audio

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["lutris"]
