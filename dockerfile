FROM python:3.5
MAINTAINER Tangjiayi


RUN apt-get update\
	&& apt-get -y install sudo\
	&& sudo apt-get update && sudo apt-get dist-upgrade --assume-yes\
	&& apt-get install rpm --assume-yes\
	&& sudo apt-get install mysql-server --assume-yes\
	&& sudo apt-get  install nginx --assume-yes\
	&& rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove $buildDeps
