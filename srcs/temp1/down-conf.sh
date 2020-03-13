#	DOWNLOADING
#   Downloading phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz -P /temp/
#	Unzipping
tar -zxvf /temp/phpMyAdmin-4.9.0.1-all-languages.tar.gz -C /temp
#	Moving
mv /temp/phpMyAdmin-4.9.0.1-all-languages.tar.gz /var/www/html/phpmyadmin

#	Downloading wordpress
wget https://wordpress.org/latest.tar.gz -P /temp
#	Unzipping wordpress
tar -zxvf /temp/latest.tar.gz -C /temp
#	Moving wordpress
mv /temp/wordpress /var/www/html/

#   CONFIGURING PHPMYADMIN AND NGINX
#   configuring phpmyadmin/config.php file
mv /temp/config.inc.php /var/www/html/phpmyadmin/
#   modify /etc/nginx/default file
mv /temp/default /etc/nginx/sites-available/
#	Configuring wordpress/wp-config.php file
mv /temp/wp-config.php /var/www/html/wordpress/
rm /var/www/html/wordpress/wp-config.php
