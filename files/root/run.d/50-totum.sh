if [ ! -d /data/totum ]; then
	mkdir -p /data/totum
	chown www:www /data/totum
fi
if [ ! -d /data/totum/fls ]; then
	mkdir -p /data/totum/fls
	cp /src/totum/fls/* /data/totum/fls/
	chown www:www /data/totum/fls
fi
if [ ! -d /data/totum/myLogs ]; then
	mkdir -p /data/totum/myLogs
	chown www:www /data/totum/myLogs
fi
if [ ! -d /data/totum/backups ]; then
	mkdir -p /data/totum/backups
	chown www:www /data/totum/backups
fi
if [ ! -d /data/totum/totumTmpfiles ]; then
	mkdir -p /data/totum/totumTmpfiles
	chown www:www /data/totum/totumTmpfiles
fi
if [ ! -f /data/totum/Conf.php ]; then
	touch /data/totum/Conf.php
	chown www:www /data/totum/Conf.php
	/var/www/totum-mit/bin/totum install --pgdump=pg_dump --psql=psql -e -- ru no-multi $TOTUM_SCHEMA_NAME $TOTUM_ADMIN_EMAIL $TOTUM_DOMAIN admin $TOTUM_ADMIN_PASS $TOTUM_DB_NAME $TOTUM_DB_HOST $TOTUM_DB_USER $TOTUM_DB_PASS
fi
