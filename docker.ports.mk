.PHONY: info build install

DOCKER = docker
PREFIX = ${HOME}/.local
NVIDIA_DRIVER = 470.103.01

info:
	@echo ${PORTNAME}:${PORTVERSION}

build:
	${DOCKER} build \
		--build-arg USER_UID="$$(id -u)" \
		--build-arg USER_GID="$$(id -g)" \
		--build-arg VIDEO_GID="$$(getent group video | cut -d: -f3)" \
		--build-arg AUDIO_GID="$$(getent group audio | cut -d: -f3)" \
		--build-arg DIALOUT_GID="$$(getent group dialout | cut -d: -f3)" \
		--build-arg NVIDIA_DRIVER="${NVIDIA_DRIVER}" \
		-t ${PORTNAME}:${PORTVERSION} .

install: build
	cp run.sh ${PREFIX}/bin/${PORTNAME}
