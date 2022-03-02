#!/bin/bash


apt-get update
apt-get install -y --no-install-recommends \
    tango-starter \
    libmariadb3 \
    inetutils-ping \
    procps \
    wait-for-it

dpkg -i /*deb
ldconfig

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm /*deb

