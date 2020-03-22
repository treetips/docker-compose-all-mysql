#!/bin/sh
. ./environment.sh
containerName=$1

getContainerName() {
  docker ps -f name=${containerName} --format "{{.Names}}"
}

WAIT_MAX=30
retryCount=0
until docker exec -it $(getContainerName) sh -c "${MYSQL_ADMIN_PING_CMD}" > /dev/null 2>&1 ; do
  if [ ${retryCount} -ge ${WAIT_MAX} ]; then
    echo "$(red '[ERROR]') could not connect to mysql"
    exit 1
  fi
  sleep 1
  retryCount=$(expr ${retryCount} + 1)
  echo "$(yellow '[WARN]') [$(printf "%02d\n" ${retryCount})/${WAIT_MAX}] waiting for running..."
done

docker exec -it $(getContainerName) sh -c "${MYSQL_CONNECT_CMD}"
