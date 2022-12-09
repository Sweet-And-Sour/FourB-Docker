FROM mariadb:10.9

ARG DB_CONTAINER_USER
ARG DB_CONTAINER_GROUP

ENV LC_ALL C.UTF-8

RUN usermod -u 1000 ${DB_CONTAINER_USER} \
    && groupmod -g 1000 ${DB_CONTAINER_GROUP}

COPY my.cnf /etc/mysql/my.cnf

COPY 221210_rc1.sql /home/db_structure.sql
COPY db_init.sh /home/db_init.sh
