#!/usr/bin/env bash
#   Switch to auto mode for the entire script
export DEBIAN_FRONTEND=noninteractive

#	UPDATING
apt-get -y update

#   A ready configuration of mysql server installation
mv /tmp/debconf/config.dat /var/cache/debconf/
mv /tmp/debconf/passwords.dat /var/cache/debconf/

#   Downloading mysql server package & installing it 
wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb -P /tmp/
dpkg -i /tmp/mysql-apt-config_0.8.13-1_all.deb
apt-get -y update
apt-get -y upgrade
apt-get install -y mysql-server

sh /tmp/start_services.sh

#  Creating mysql tables
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql
mysql < /tmp/create_user.sql
#   Automatizing Wordpress site configuration
mysql < /tmp/wordpress.sql
