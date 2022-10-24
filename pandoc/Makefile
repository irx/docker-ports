.POSIX:

PORTNAME = pandoc
PORTVERSION = latest

include ../docker.ports.mk

install: build
	cp run.sh "${PREFIX}/bin/${PORTNAME}"
	ln -s "${PORTNAME}" "${PREFIX}/bin/htlatex"
	ln -s "${PORTNAME}" "${PREFIX}/bin/ps2eps"
	ln -s "${PORTNAME}" "${PREFIX}/bin/texi2pdf"
