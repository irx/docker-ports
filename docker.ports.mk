.PHONY: info build install

DOCKER = docker

info:
	@echo ${PORTNAME}:${PORTVERSION}

build:
	${DOCKER} build \
		--pull \
		--no-cache \
		--build-arg USER_UID="$$(id -u)" \
		--build-arg USER_GID="$$(id -g)" \
		--build-arg VIDEO_GID="$$(getent group video | cut -d: -f3)" \
		--build-arg AUDIO_GID="$$(getent group audio | cut -d: -f3)" \
		--build-arg INPUT_GID="$$(getent group input | cut -d: -f3)" \
		--build-arg DIALOUT_GID="$$(getent group dialout | cut -d: -f3)" \
		-t ${PORTNAME}:${PORTVERSION} .

install: build
	cp run.sh ${PREFIX}/bin/${PORTNAME}
