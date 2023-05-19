FROM ubuntu:18.04

ARG NVIDIA_DRIVER=470.103.01
ARG VIDEO_GID=27
ARG AUDIO_GID=18
ENV DEBIAN_FRONTEND noninteractive

# Check if nvidia version is defined
RUN test -n "${NVIDIA_DRIVER}" || ( echo "Please provide nvidia driver version" && exit 1 )

# Install requirements
ADD https://repo.steampowered.com/steam/archive/precise/steam_latest.deb /tmp/steam.deb
ADD https://uk.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_DRIVER}/NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run /tmp/NVIDIA.run
RUN dpkg --add-architecture i386 && apt-get update &&  apt-get install -y \
	libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386 module-init-tools
RUN sh /tmp/NVIDIA.run --help
RUN apt-get install -y /tmp/steam.deb \
	&& sh /tmp/NVIDIA.run -a -N --ui=none --no-kernel-module

RUN groupdel sudo # likely collides with video
RUN groupdel video && groupadd -g ${VIDEO_GID} video
RUN groupdel audio && groupadd -g ${AUDIO_GID} audio

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["steam"]
