#	STARTING SERVICES
#   restart mysql service
/etc/init.d/mysql restart
#   restart nginx service
/etc/init.d/nginx restart
#   restart php service
/etc/init.d/php7.3-fpm start

service --status-all
