FROM archlinux:latest

RUN pacman -Sy --noconfirm mandoc doas texlive-most pandoc ghostscript texinfo
RUN echo 'permit nopass root' > /etc/doas.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash", "-l"]
