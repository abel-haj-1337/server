#!/usr/bin/env bash
#   Switch to auto mode for the entire script
export DEBIAN_FRONTEND=noninteractive

#	UPDATING
apt-get -y update

#   INSTALLING REQUIRED PACKAGES

#   Instaling NginX
apt-get install -y nginx
apt-get install -y wget
apt-get install -y vim
#   Installing php v.7.3
apt-get install -y php7.3-mysql
#   FastCGI process manager module for NginX
apt-get install -y php7.3-fpm
#   Required modules for php7.3
apt-get install -y php7.3-common
apt-get install -y php7.3-mbstring
apt-get install -y php7.3
####							####
# installing mysql using wget	   #
# depends on lsb-release, gnupg	   #
###								####
apt-get install -y lsb-release gnupg
