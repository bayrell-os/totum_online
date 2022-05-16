ARG ARCH=amd64
FROM bayrell/alpine_php_fpm:8.0-1-${ARCH}

ARG ARCH
ENV ARCH=${ARCH}

RUN cd ~; \
	apk update; \
	apk upgrade; \
	apk add php8-pdo_pgsql postgresql-client; \
	echo 'Ok'
	
RUN cd ~; \
	sed -i 's|pm.max_children =.*|pm.max_children = 20|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|pm.start_servers =.*|pm.start_servers = 10|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|pm.min_spare_servers =.*|pm.min_spare_servers = 10|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|pm.max_spare_servers =.*|pm.max_spare_servers = 20|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|php_admin_value\[memory_limit\] =.*|php_admin_value[memory_limit] = 1024M|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|php_admin_value\[upload_max_filesize\] =.*|php_admin_value[upload_max_filesize] = 10M|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|php_admin_value\[post_max_size\] =.*|php_admin_value[post_max_size] = 0|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|php_admin_value\[opcache.enable\] =.*|php_admin_value[opcache.enable] = 1|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|php_admin_value\[opcache.enable_cli\] =.*|php_admin_value[opcache.enable_cli] = 1|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|php_admin_value\[opcache.memory_consumption\] =.*|php_admin_value[opcache.memory_consumption] = 128M|g' /etc/php8/php-fpm.d/www.conf; \
	sed -i 's|php_admin_value\[jit_buffer_size\] =.*|php_admin_value[jit_buffer_size] = 64M|g' /etc/php8/php-fpm.d/www.conf; \
	echo 'Ok'
	
COPY files/etc/nginx /etc/nginx
COPY files/root/run.d /root/run.d
COPY files/src/totum-mit /src/totum-mit
COPY files/var/www/totum-mit /var/www/totum-mit

RUN cd ~; \
	chmod +x /root/run.sh; \
	ln -s /data/totum-mit/Conf.php /var/www/totum-mit/Conf.php; \
	ln -s /data/totum-mit/fls /var/www/totum-mit/http/fls; \
	ln -s /data/totum-mit/myLogs /var/www/totum-mit/myLogs; \
	ln -s /data/totum-mit/backups /var/www/totum-mit/backups; \
	ln -s /data/totum-mit/totumTmpfiles /var/www/totum-mit/totumTmpfiles; \
	echo 'Ok'
