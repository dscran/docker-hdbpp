FROM debian:bullseye as build
MAINTAINER MBI Berlin, Division B
# some concepts from
# https://salsa.debian.org/jgoerzen/docker-debian-base
# and
# https://gitlab.com/s2innovation/tangobox-docker


COPY setup/ /usr/local/tango-base-setup
RUN /usr/local/debian-base-setup/010-tango-base.sh


