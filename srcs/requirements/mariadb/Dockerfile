FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start; mysql < /var/www/init_db.sql && rm -f /var/www/init_db.sql;

EXPOSE 3306

CMD ["mysqld"]