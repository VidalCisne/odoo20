#!/bin/bash
set -e
cat > /tmp/odoo.conf <<EOF
[options]
admin_passwd = ${ADMIN_PASSWD}
db_host = ${DB_HOST}
db_port = 5432
db_user = ${DB_USER}
db_password = ${DB_PASSWORD}
db_name = ${DB_NAME}
db_sslmode = require
dbfilter = ^${DB_NAME}\$
list_db = False
http_port = ${PORT:-8069}
addons_path = /app/addons,/app/custom_addons
workers = 0
proxy_mode = True
data_dir = /tmp/odoo-data
EOF
exec python /app/odoo-bin -c /tmp/odoo.conf