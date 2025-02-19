.POSIX:

PORTNAME = wine
PORTVERSION = latest

include ../docker.ports.mk

install: build
	cp run.sh "${PREFIX}/bin/${PORTNAME}"
	ln -s "${PORTNAME}" "${PREFIX}/bin/winetricks"
	ln -s "${PORTNAME}" "${PREFIX}/bin/winecfg"
