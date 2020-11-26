#!/usr/bin/env bash
#   Switch to auto mode for the entire script
export DEBIAN_FRONTEND=noninteractive

#	UPDATING
apt-get -y update


#   Installing PHPMYADMIN
#   Installing WORDPRESS
wget https://wordpress.org/latest.tar.gz -P /tmp
tar -zxvf /tmp/latest.tar.gz -C /tmp
mv /tmp/wordpress /var/www/html/

#   Downloading PhpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz -P /tmp/
#   Unzipping PhpMyAdmin
tar -zxvf /tmp/phpMyAdmin-4.9.0.1-all-languages.tar.gz -C /tmp
#   Moving PhpMyAdmin
mv /tmp/phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin

#   Configuring the services
#   Configuring phpmyadmin/config.php file
mv /tmp/config.inc.php /var/www/html/phpmyadmin/
#	Configuring wordpress
mv /tmp/wp-config.php /var/www/html/wordpress/
rm /var/www/html/wordpress/wp-config-sample.php
#   Creating a self-signed certificate & key [30 days, no password, rsa]
openssl req -newkey rsa:4096 -x509 -nodes -subj "/CN=localhost" -out ssl_certificate.crt -keyout ssl_key.key
mv ssl_certificate.crt ssl_key.key /etc/ssl/certs/
#   Configuring NginX
mv /tmp/default /etc/nginx/sites-available/
