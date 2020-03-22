#!/bin/sh
. ./environment.sh
./connect-docker-mysql.sh ${MARIADB_CONTAINER_NAME_PREFIX}10.1
