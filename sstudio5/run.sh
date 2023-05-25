#!/bin/sh

wmname LG3D

docker run -it --rm --net=host --env="DISPLAY" \
	--env="_JAVA_AWT_WM_NONREPARENTING=1" \
	--env="USER_ID=1001" \
	--env="GROUP_ID=1001" \
	--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
	-v /mnt/aux/sstudio5:/home/user \
	--privileged \
	--ipc=host \
	sstudio5:latest \
	bash
