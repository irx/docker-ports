#!/bin/sh

uid="$(id -u)"
gid="$(id -g)"
cwd="$(pwd)"
cmd="$(basename $0)"

docker run -it --rm --net=host --env="DISPLAY" \
	--env="_JAVA_AWT_WM_NONREPARENTING=1" \
	--env="USER_ID=$uid" \
	--env="GROUP_ID=$gid" \
	--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
	-v "$cwd:/cwd" \
	--privileged \
	--ipc=host \
	wine:latest \
	"$cmd $@"
