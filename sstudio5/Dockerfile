FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_UID=1000
ARG USER_GID=1000
ARG VIDEO_GID=27
ARG AUDIO_GID=28
ARG DIALOUT_GID=14
ARG USB_GID=85

RUN groupadd -g "${USER_GID}" user && useradd -u ${USER_UID} -g ${USER_GID} -ms /bin/bash user
RUN awk -F ":" "{ if (\$3 == \"${AUDIO_GID}\") {print \$1; exit 0;} }" </etc/group | xargs groupdel || :
RUN awk -F ":" "{ if (\$3 == \"${VIDEO_GID}\") {print \$1; exit 0;} }" </etc/group | xargs groupdel || :
RUN awk -F ":" "{ if (\$3 == \"${DIALOUT_GID}\") {print \$1; exit 0;} }" </etc/group | xargs groupdel || :
RUN awk -F ":" "{ if (\$3 == \"${USB_GID}\") {print \$1; exit 0;} }" </etc/group | xargs groupdel || :
RUN groupdel audio && groupdel video \
	&& groupadd -g ${AUDIO_GID} audio \
	&& groupadd -g ${VIDEO_GID} video \
	&& groupadd -g ${DIALOUT_GID} dialout \
	&& groupadd -g ${USB_GID} usb \
	&& usermod -aG audio,video,dialout,usb user

RUN dpkg --add-architecture i386 && \
    sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt update \
&& apt install -y \
	libqt5network5 \
	wine \
	wine32 \
	wine64 \
	libncurses5 \
	git-all \
	git-lfs \
	make \
	libnss3 \
	libslf4j-java \
	libswt-cairo-gtk-4-jni \
	libswt-glx-gtk-4-jni \
	libswt-gtk-4-java \
	libswt-gtk-4-jni \
	libswt-webkit-gtk-4-jni

USER user
