#!/bin/sh
. .env
docker exec -it ${MYSQL_CONTAINER_NAME_PREFIX}5.6 sh -c "mysql --defaults-group-suffix=${DEFAULTS_GROUP_SUFFIX}"
