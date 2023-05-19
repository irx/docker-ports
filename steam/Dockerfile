FROM archlinux:latest

ARG NVIDIA_DRIVER=470.103.01
ARG VIDEO_GID=27
ARG AUDIO_GID=18

RUN printf '[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf
RUN pacman -Sy --noconfirm \
	steam \
	mandoc \
	doas \
	wine \
	gnutls \
	lib32-alsa-plugins \
	lib32-gnutls \
	lib32-gstreamer \
	lib32-libgpg-error \
	lib32-libldap \
	lib32-libpulse \
	lib32-mesa \
	lib32-mesa \
	lib32-openal \
	lib32-sqlite \
	lib32-vulkan-icd-loader \
	lib32-vulkan-intel \
	lib32-vulkan-radeon \
	mesa \
	nss \
	qt5-base \
	samba \
	vulkan-icd-loader \
	vulkan-intel \
	vulkan-radeon \
	vulkan-tools \
	winetricks \
	xf86-video-amdgpu \
	zenity
RUN echo 'permit nopass root' > /etc/doas.conf

RUN test -n "${NVIDIA_DRIVER}" || ( echo "Please provide nvidia driver version" && exit 1 )
ADD https://uk.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_DRIVER}/NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run /tmp/NVIDIA.run
RUN sh /tmp/NVIDIA.run --help && sh /tmp/NVIDIA.run -a -N --ui=none --no-kernel-module

RUN awk -F ":" "{ if (\$3 == \"${AUDIO_GID}\") {print \$1; exit 0;} }" </etc/group | xargs groupdel || :
RUN awk -F ":" "{ if (\$3 == \"${VIDEO_GID}\") {print \$1; exit 0;} }" </etc/group | xargs groupdel || :
RUN groupdel audio || : ; groupdel video || : ; \
	groupadd -g ${AUDIO_GID} audio \
	&& groupadd -g ${VIDEO_GID} video

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["steam"]
