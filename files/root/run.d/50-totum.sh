if [ ! -d /data/totum-mit ]; then
	mkdir -p /data/totum-mit
	chown www:www /data/totum-mit
fi
if [ ! -d /data/totum-mit/fls ]; then
	mkdir -p /data/totum-mit/fls
	cp /src/totum-mit/fls/* /data/totum-mit/fls/
	chown www:www /data/totum-mit/fls
fi
if [ ! -d /data/totum-mit/myLogs ]; then
	mkdir -p /data/totum-mit/myLogs
	chown www:www /data/totum-mit/myLogs
fi
if [ ! -d /data/totum-mit/backups ]; then
	mkdir -p /data/totum-mit/backups
	chown www:www /data/totum-mit/backups
fi
if [ ! -d /data/totum-mit/totumTmpfiles ]; then
	mkdir -p /data/totum-mit/totumTmpfiles
	chown www:www /data/totum-mit/totumTmpfiles
fi
if [ ! -f /data/totum-mit/Conf.php ]; then
	touch /data/totum-mit/Conf.php
	chown www:www /data/totum-mit/Conf.php
	/var/www/totum-mit/bin/totum install --pgdump=pg_dump --psql=psql -e -- ru no-multi $TOTUM_SCHEMA_NAME $TOTUM_ADMIN_EMAIL $TOTUM_DOMAIN admin $TOTUM_ADMIN_PASS $TOTUM_DB_NAME $TOTUM_DB_HOST $TOTUM_DB_USER $TOTUM_DB_PASS
fi
