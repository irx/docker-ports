ARG VIDEO_GID=27
ARG AUDIO_GID=18
FROM archlinux:latest

RUN printf '[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
RUN pacman -Sy --noconfirm lutris mandoc doas wine lib32-mesa mesa lib32-vulkan-icd-loader vulkan-icd-loader lib32-vulkan-intel vulkan-intel vulkan-tools gnutls lib32-gnutls winetricks lib32-libldap lib32-libgpg-error lib32-sqlite lib32-libpulse lib32-alsa-plugins lib32-openal samba zenity qt5-base
RUN echo 'permit nopass root' > /etc/doas.conf

RUN groupdel video && groupadd -g ${VIDEO_GID} video
RUN groupdel audio && groupadd -g ${AUDIO_GID} audio

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["lutris"]
