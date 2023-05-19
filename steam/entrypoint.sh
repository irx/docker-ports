#!/bin/sh

USER=${USER:-steam}
if [ -n "${USER_UID}" ]
then
	# Fix snd ownership
	ESND_HOST_GID=$(stat -c "%g" /dev/snd/$(ls /dev/snd/ | head -1))
	#grep $SND_HOST_GID /etc/group || groupadd -g $SND_HOST_GID host-audio
	useradd -M -s /bin/bash -u "$USER_UID" -o -d "/home/${USER}" "${USER}"
	usermod -aG wheel,audio,video "${USER}" #"$(getent group $SND_HOST_GID | cut -f1 -d":"),video"
	[ -n "${GROUPS}" ] && usermod -aG "${GROUPS}" "${USER}"
	mkdir -p "/home/${USER}/.local/share" && chown -R "${USER}:${USER}" "/home/${USER}"
	exec doas -u "${USER}" "$@"
else
	exec "$@"
fi
