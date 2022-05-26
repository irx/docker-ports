#!/bin/sh

if [ -n "$USER_ID" ]
then
	useradd -M -s /bin/bash -u "$USER_ID" -o -d /home/user user
	usermod -aG wheel,audio,video user
	[ -n "$GROUPS" ] && usermod -aG "$GROUPS" user
	chown -R user:user /home/user
	exec doas -u user "$@"
else
	exec "$@"
fi
