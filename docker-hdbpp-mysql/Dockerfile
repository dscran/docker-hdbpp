FROM mysql:debian
MAINTAINER MBI Berlin, Division B
# some concepts from
# https://salsa.debian.org/jgoerzen/docker-debian-base
# and
# https://gitlab.com/s2innovation/tangobox-docker
#

COPY setup/create_hdb++_mysql_innodb_json.sql /docker-entrypoint-initdb.d/101_hdbpp_init.sql
COPY setup/create_hdbpp_users.sql /docker-entrypoint-initdb.d/102_user_init.sql


EXPOSE 3306
VOLUME /var/lib/mysql

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld"]
