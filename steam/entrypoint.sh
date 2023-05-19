#!/bin/sh

USER=${USER:-steam}

# Fix snd ownership
ESND_HOST_GID=$(stat -c "%g" /dev/snd/$(ls /dev/snd/ | head -1))
#grep $SND_HOST_GID /etc/group || groupadd -g $SND_HOST_GID host-audio
groupadd -g ${USER_GID} ${USER}
useradd ${USER} -u ${USER_UID} -g ${USER_GID} -G video,audio #"$(getent group $SND_HOST_GID | cut -f1 -d":"),video"
mkdir -p "/home/${USER}/.local/share" && chown -R "${USER}:${USER}" /home/${USER}

su - "${USER}" -c "$@"
