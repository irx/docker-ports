#!/bin/sh

docker run -it --rm --net=host --env="DISPLAY" \
	--env="_JAVA_AWT_WM_NONREPARENTING=1" \
	--env="USER_ID=$(id -u)" \
	--env="GROUP_ID=$(id -g)" \
	--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
	-v /mnt/aux/lutris:/home/user \
	--privileged \
	--ipc=host \
	lutris:latest
