#	Download debian image and expose useful ports
FROM debian:buster 
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 3306/tcp

COPY exec.sh /tmp/
COPY default /tmp/
COPY config.inc.php /tmp/
COPY wp-config.php /tmp/
COPY start-serv.sh /tmp/
COPY create_user.sql /tmp/

#RUN sh /tmp/exec.sh
