#!/usr/bin/env bash

# Install Nginx
sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'
sudo service nginx start

# Create directories
mkdir -p /data/web_static/{releases/test,shared,current}

# Create "index.html" with hello, wordl
echo "Hello, World" | sudo tee /data/web_static/releases/test/index.html > /dev/null

# Create a symbolic link
sudo ln -sfn /data/web_static/releases/test/ /data/web_static/current

#Set ownership and permissions
sudo chown -R ubuntu:ubuntu /data/

# Update Nginx config
nginx_config="/etc/nginx/sites-available/default"
nginx_config_link="/etc/nginx/sites-enabled/default"

sudo sed -i '/server_name _/a \\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}' "$nginx_config"

# Remove and recreate the symbolic link to apply changes
[ -e "$nginx_config_link" ] && sudo rm "$nginx_config_link"
sudo ln -s "$nginx_config" "$nginx_config_link"

# Restart Nginx to apply changes
sudo service nginx restart
