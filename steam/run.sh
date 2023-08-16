#!/bin/sh

USER_UID="$(id -u)"
USER_GID="$(id -g)"

NVIDIA_VERSION="$(nvidia-smi -q 2> /dev/null | grep "Driver Version" | awk '{ print $4}')"
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
STEAM_DIR="/mnt/steam"

[ -z "${NVIDIA_VERSION}" ] \
	&& echo "Error getting host nvidia driver information. Please check your nvidia installation and retry." \
	&& exit 1

docker run --rm -it \
	-e "USER_UID=${USER_UID}" \
	-e "USER_GID=${USER_GID}" \
	-e "DISPLAY" \
	-e "XAUTHORITY=${XAUTH}" \
	-e "TZ=$(date +%Z)" \
	--ulimit nofile=262144:262144 \
	--ulimit core=-1 \
	--ulimit data=-1 \
	--ulimit fsize=-1 \
	-v "${STEAM_DIR}:/home/steam" \
	-v "/dev/shm:/dev/shm" \
	-v "${XSOCK}:${XSOCK}" \
	-v "${XAUTH}:${XAUTH}" \
	--net host --privileged \
	--ipc host \
	steam:latest
