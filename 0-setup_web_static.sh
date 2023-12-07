#!/usr/bin/env bash

# Install Nginx
sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'
sudo service nginx start

# Create directories
mkdir -p /data/web_static/{releases/test,shared,current}

# Create "index.html" with hello, wordl
echo "Hello, World" > /data/web_static/releases/test/index.html

# Create a symbolic link
sudo ln -sfn /data/web_static/releases/test/ /data/web_static/current

#Set ownership and permissions
sudo chown -R ubuntu:ubuntu /data/

