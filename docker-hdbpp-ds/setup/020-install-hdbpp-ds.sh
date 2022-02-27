#!/bin/bash

# disable automatic service start during build
mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d

apt-get update
apt-get install -y --no-install-recommends \
    tango-starter \
    libmariadb3

dpkg -i /*deb
ldconfig
/lib/systemd/systemd-sysv-install enable tango-starter

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm /*deb
/usr/local/bin/docker-wipelogs

# enable service starts again
mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled
