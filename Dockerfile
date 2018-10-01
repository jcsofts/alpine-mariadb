FROM alpine:3.7

ENV LC_ALL=en_GB.UTF-8

RUN apk update \
	&& apk add mariadb mariadb-client \
	&& mkdir /docker-entrypoint-initdb.d \
  	&& rm -rf /tmp/src \
  	&& rm -rf /var/cache/apk/*


VOLUME /var/lib/mysql


# && sed -Ei 's/^(bind-address|log)/#&/' /etc/my.cnf.d/mariadb-server.cnf \
#  	&& echo -e 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/my.cnf.d/mariadb-server.cnf > /tmp/my.cnf \
# && mv /tmp/my.cnf /etc/my.cnf.d/mariadb-server.cnf \

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
