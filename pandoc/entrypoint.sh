#!/bin/sh

if [ -n "$USER_ID" ] && [ "$(id -u)" = "0" ]
then
	useradd -m -s /bin/bash -u "$USER_ID" -o -d /home/user user
	usermod -aG wheel,audio,video user
	[ -n "$GROUPS" ] && usermod -aG "$GROUPS" user
	chown -R user:user /home/user
	exec doas -u user $0 "$@"
else
	cd /cwd
	echo "$@" > /tmp/cmd
	bash /tmp/cmd
fi
