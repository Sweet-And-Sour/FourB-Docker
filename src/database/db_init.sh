#!/bin/bash

echo DB 초기화용 스크립트

USERNAME=$MYSQL_ROOT_USER
PASSWORD=$MYSQL_ROOT_PASSWORD
DATABASE=$MYSQL_DB_NAME

mysql -u$USERNAME -p$PASSWORD -e "DROP DATABASE IF EXISTS $DATABASE"

mysql -u$USERNAME -p$PASSWORD -e "CREATE DATABASE $DATABASE"

echo "Created FourB Database."

mysql -u$USERNAME -p$PASSWORD $DATABASE -t < /home/db_structure.sql

echo "DB Init Complete."
