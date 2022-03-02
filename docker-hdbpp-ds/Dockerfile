FROM debian:bullseye-slim as build
MAINTAINER MBI Berlin, Division B
# some concepts from
# https://salsa.debian.org/jgoerzen/docker-debian-base
# and
# https://gitlab.com/s2innovation/tangobox-docker
#


### build HDB++ packages
ENV DEBIAN_FRONTEND=noninteractive
COPY setup/01*sh /
RUN /010-install_deps.sh
RUN /011-build-libhdbpp.sh
RUN /012-build-libhdbpp-mysql.sh
RUN /013-build-hdbpp-cm.sh
RUN /014-build-hdbpp-es.sh


### install in fresh container for deployment
FROM debian:bullseye-slim
ENV DEBIAN_FRONTEND=noninteractive

COPY --from=build /libhdbpp_2.0.0-SNAPSHOT_amd64.deb /
COPY --from=build /libhdbpp-mysql_1.2.0-SNAPSHOT_amd64.deb /
COPY --from=build /hdbpp-cm_2.0.0-SNAPSHOT_amd64.deb /
COPY --from=build /hdbpp-es_2.0.0-SNAPSHOT_amd64.deb /

COPY setup/020-install-hdbpp-ds.sh /
COPY setup/start_tango-starter.sh /usr/local/bin/start_tango-starter.sh

RUN /020-install-hdbpp-ds.sh

# user tango already created by installing tango-starter from apt
USER tango

CMD ["/usr/local/bin/start_tango-starter.sh"]
