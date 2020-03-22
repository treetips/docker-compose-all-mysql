#!/bibn/sh
MYSQL_INITDBD_MY_CNF_PATH="/auto-generate/my.cnf"

initMysqlInitdbdMyCnf() {
  cat << EOF > ${MYSQL_INITDBD_MY_CNF_PATH}
[client]
user="${MYSQL_USER}"
password="${MYSQL_PASSWORD}"
[mysql]
database="${MYSQL_DATABASE}"
local-infile=1
EOF
}

getMysqlInitdbdOption() {
  echo "--defaults-extra-file=${MYSQL_INITDBD_MY_CNF_PATH}"
}
