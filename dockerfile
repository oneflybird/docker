FROM python:3.6
MAINTAINER Tangjiayi

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils\
	apt-get update && apt-get install sudo --assume-yes\
	apt-get update && apt-get install vim --assume-yes\
	apt-get update && sudo apt-get dist-upgrade --assume-yes\
	apt-get update && apt-get install rpm --assume-yes\
	apt-get update && sudo apt-get install mysql-server --assume-yes\
	apt-get update && sudo apt-get  install nginx --assume-yes\
	apt-get update && sudo apt-get  install net-tools --assume-yes\
	&& rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove $buildDeps

ADD . /opt/python_planet/
ADD ./nginx /etc/nginx/
WORKDIR /opt/python_planet/
RUN pip install -r requirments.txt
ADD ./cert /root/cert/
