#!/bin/sh
. .env
docker exec -it ${MARIADB_CONTAINER_NAME_PREFIX}10.0 sh -c "mysql --defaults-group-suffix=${DEFAULTS_GROUP_SUFFIX}"
