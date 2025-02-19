FROM archlinux:latest

RUN printf '[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
RUN pacman -Sy --noconfirm mandoc doas wine winetricks libunwind
RUN echo 'permit nopass root' > /etc/doas.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash", "-l"]
