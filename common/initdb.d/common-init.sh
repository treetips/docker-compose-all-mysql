#!/bin/sh
. /app/share/functions.sh

initMysqlInitdbdMyCnf

echo "#######################################################"
echo "# Execute init scripts"
echo "#######################################################"
ls -lR /app

mysql $(getMysqlInitdbdOption) < /app/share/test_country.sql
