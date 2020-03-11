#	Download image
FROM debian:buster 
EXPOSE 80
EXPOSE 443
EXPOSE 3306
RUN export DEBIAN_FRONTEND=noninteractive

#	Update
RUN apt-get update

#	Install NginX
RUN apt-get install -y nginx
RUN apt-get install -y php7.3
RUN apt-get install -y php7.3-common
RUN apt-get install -y php7.3-mbstring
RUN apt-get install -y php7.3-mysql
# fastCGI process manager module for nginx
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y wget
#RUN apt-get install -y default-mysql-server
#RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
#RUN apt install -y mysql-apt-config_0.8.15-1_all.deb
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
# modify phpmyadmin/config.php file
COPY config.inc.php /var/www/html/phpmyadmin/
# restart mysql service
# RUN /etc/init.d/mysql restart
# execute create_tables.sql
# RUN mysql -u root -p ""
# modify /etc/nginx/default file
COPY default /etc/nginx/sites-available/
# restart nginx service
RUN apt-get update
# RUN chown -R www-data:www-data /var/www/*
# RUN chmod -R 755 /var/www/*
# RUN echo "CREATE DATABASE wordpress;" | mysql -u root
# RUN echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
# RUN echo "FLUSH PRIVILEGES;" | mysql -u root
# RUN echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
RUN service php7.3-fpm start
#RUN service mysql restart
RUN /etc/init.d/nginx restart
# RUN mysql < /var/www/html/phpmyadmin/sql/create_tables.sql
# RUN wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
# RUN apt install -y ./mysql-apt-config_0.8.13-1_all.deb
