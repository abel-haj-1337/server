#	Download image
FROM debian:buster 

#	Update
RUN apt-get update

#	Install NginX
RUN apt-get install -y nginx
