#!/usr/bin/env bash

# Install Nginx
apt-get update
apt-get -y install nginx
ufw allow 'Nginx HTTP'
service nginx start
mkdir /data/
mkdir /data/web_static/
mkdir /data/web_static/releases/
mkdir /data/web_static/shared/
mkdir /data/web_static/releases/test/
echo "Hello, World" > /data/web_static/releases/test/index.html
ln -s /data/web_static/releases/test/ /data/web_static/current
sudo chown ubuntu 700 /data/
