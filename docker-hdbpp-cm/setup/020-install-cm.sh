#!/bin/bash


apt-get update
apt-get install -y --no-install-recommends \
    libtango9 \
    libmariadb3

dpkg -i /*deb
ldconfig

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm /*deb

