#	UPDATING
apt-get update

#   INSTALLING REQUIRED PACKAGES
#   Instaling NginX
apt-get install -y nginx
#   Installing php v.7.3
apt-get install -y php7.3
apt-get install -y php7.3-common
apt-get install -y php7.3-mbstring
apt-get install -y php7.3-mysql
#   fastCGI process manager module for nginx
apt-get install -y php7.3-fpm
apt-get install -y wget
apt-get install -y default-mysql-server

mkdir /temp

#   installing phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz -P /temp/
tar -zxvf /temp/phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv /temp/phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin

#   CONFIGURING PHPMYADMIN AND NGINX
#   configuring phpmyadmin/config.php file
mv /temp/config.inc.php /var/www/html/phpmyadmin/
#   modify /etc/nginx/default file
mv /temp/default /etc/nginx/sites-available/

#   restart mysql service
/etc/init.d/mysql restart

#   restart nginx service
/etc/init.d/nginx restart

#   creating mysql tables
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql
# wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
# apt install -y ./mysql-apt-config_0.8.13-1_all.deb








