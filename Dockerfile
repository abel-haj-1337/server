#	Download debian image
FROM    debian:buster 
#   Expose useful ports
EXPOSE  80/tcp
EXPOSE  443/tcp

#	Moving useful files
ADD     srcs /tmp/

#	Executing
RUN     sh /tmp/install_system.sh
RUN     sh /tmp/configure_pma_wp.sh
RUN     sh /tmp/install_mysql.sh
#   
CMD     sh /tmp/start_services.h
