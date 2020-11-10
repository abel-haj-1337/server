#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

#	UPDATING
apt-get update

#   INSTALLING REQUIRED PACKAGES
#   Instaling NginX
apt-get install -y nginx
apt-get install -y wget
apt-get install -y vim
#   Installing php v.7.3
apt-get install -y php7.3-mysql
#   fastCGI process manager module for nginx
apt-get install -y php7.3-fpm
apt-get install -y php7.3-common
apt-get install -y php7.3-mbstring
apt-get install -y php7.3
####							####
# installing mysql using wget	   #
# depends on lsb-release, gnupg	   #
###								####
apt-get install -y lsb-release gnupg

debconf-set-selections <<< 'mysql-apt-config mysql-apt-config/select-server select mysql-5.7'
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password password'

wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb -P /tmp/
dpkg -i /tmp/mysql-apt-config_0.8.13-1_all.deb
apt-get install -y mysql-server
apt-get -y update
apt-get -y upgrade

#   installing phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz -P /tmp/
tar -zxvf /tmp/phpMyAdmin-4.9.0.1-all-languages.tar.gz -C /tmp
mv /tmp/phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin

#   Downloading wordpress
wget https://wordpress.org/latest.tar.gz -P /tmp
#   Unzipping wordpress
tar -zxvf /tmp/latest.tar.gz -C /tmp
#   Moving wordpress
mv /tmp/wordpress /var/www/html/

#   CONFIGURING PHPMYADMIN AND WORDPRESS AND NGINX
#   configuring phpmyadmin/config.php file
mv /tmp/config.inc.php /var/www/html/phpmyadmin/
#	configuring wordpress
mv /tmp/wp-config.php /var/www/html/wordpress/
rm /var/www/html/wordpress/wp-config-sample.php
#   modify /etc/nginx/default file
mv /tmp/default /etc/nginx/sites-available/

sh /tmp/start-serv.sh

#   creating mysql tables
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql
mysql < /tmp/create_user.sql
# wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
# apt install -y ./mysql-apt-config_0.8.13-1_all.deb








