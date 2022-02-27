FROM jgoerzen/debian-base-minimal:bullseye as build
MAINTAINER MBI Berlin, Division B
# some concepts from
# https://salsa.debian.org/jgoerzen/docker-debian-base
# and
# https://gitlab.com/s2innovation/tangobox-docker
#
# Use debain base images by Johann Goerzen, as they provide familiar
# systemd init system and automatic security updates in a very slim
# container.


### build HDB++ packages
ENV DEBIAN_FRONTEND=noninteractive
COPY setup/01*sh /
RUN /010-install_deps.sh
RUN /011-build-libhdbpp.sh
RUN /012-build-libhdbpp-mysql.sh
RUN /013-build-hdbpp-cm.sh
RUN /014-build-hdbpp-es.sh


### deploy in fresh container
FROM jgoerzen/debian-base-minimal:bullseye
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    tango-starter \
    libmariadb3

COPY --from=build /libhdbpp_2.0.0-SNAPSHOT_amd64.deb /
COPY --from=build /libhdbpp-mysql_1.2.0-SNAPSHOT_amd64.deb /
COPY --from=build /hdbpp-cm_2.0.0-SNAPSHOT_amd64.deb /
COPY --from=build /hdbpp-es_2.0.0-SNAPSHOT_amd64.deb /

COPY setup/tangorc /etc/tangorc
COPY setup/020-install-hdbpp-ds.sh /
RUN /020-install-hdbpp-ds.sh


CMD ["/usr/local/bin/boot-debian-base"]
