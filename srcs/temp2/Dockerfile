#	Download image
FROM debian:buster 
EXPOSE 80
EXPOSE 443
EXPOSE 3306

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
# RUN apt-get install -y systemd
RUN apt-get install -y default-mysql-server
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
# modify phpmyadmin/config.php file
COPY config.inc.php /var/www/html/phpmyadmin/
# restart mysql service
RUN /etc/init.d/mysql restart
# execute create_tables.sql
RUN mysql < /var/www/html/phpmyadmin/sql/create_tables.sql
# modify /etc/nginx/default file
COPY default /etc/nginx/sites-available/
# restart nginx service
RUN /etc/init.d/nginx restart
# RUN wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
# RUN apt install -y ./mysql-apt-config_0.8.13-1_all.deb



