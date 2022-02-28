FROM jgoerzen/debian-base-minimal:bullseye
MAINTAINER MBI Berlin, Division B
# some concepts from
# https://salsa.debian.org/jgoerzen/docker-debian-base
# and
# https://gitlab.com/s2innovation/tangobox-docker
#
# Use debain base images by Johann Goerzen, as they provide familiar
# systemd init system and automatic security updates in a very slim
# container.

### install and setup mariadb database
COPY setup/* /
RUN /010-setup.sh

EXPOSE 3306
VOLUME /var/lib/mysql

CMD ["/usr/local/bin/boot-debian-base"]
