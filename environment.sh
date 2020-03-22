#!/bin/sh
. .env

MYSQL_DEFAULTS_GROUP_SUFFIX="WORK"
MYSQL_CONNECT_CMD="mysql --defaults-group-suffix=${MYSQL_DEFAULTS_GROUP_SUFFIX}"
MYSQL_ADMIN_PING_CMD="mysqladmin --defaults-group-suffix=${MYSQL_DEFAULTS_GROUP_SUFFIX} --silent ping"

color() {
  colorCode=$1
  message="$2"
  DEFAULT_COLOR_CODE=$(printf '\033')
  printf "${DEFAULT_COLOR_CODE}[${colorCode}m${message}${DEFAULT_COLOR_CODE}[m"
}
red() {
  color 31 "${1}"
}
yellow() {
  color 33 "${1}"
}
