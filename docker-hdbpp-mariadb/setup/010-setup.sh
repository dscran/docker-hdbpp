#!/bin/bash

# disable automatic service start during build
mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d

apt-get update
apt-get install -y --no-install-recommends \
    mariadb-server \

# perform mariadb_secure_install actions
# mysql -fu root < /mariadb_secure_installation.sql

# create database and default users
# mysql -u root < /create_hdbpp_users.sql

# init hdbpp database
# mysql -u root --database=hdbpp < /create_hdb++_mysql_innodb_json.sql

# enable network access to database by replacing localhost bind-address
# (127.0.0.1 -> 0.0.0.0)
sed -i 's/127\.0\.0\.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
/usr/local/bin/docker-wipelogs

# enable service starts again
mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled
