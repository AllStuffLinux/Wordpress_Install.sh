#!/bin/bash
# Used to create Wordpress sites for DCCC WebDev class

08:00:27:e0:ae:85
# ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

sudo yum -y update && sudo yum -y upgrade
sudo yum -y install httpd mariadb-server mariadb php php-mysql nano wget rsync
sudo systemctl start httpd.service && sudo systemctl start mariadb
sudo systemctl enable httpd.service 

sudo mysql_secure_installation
sudo systemctl enable mariadb.service
sudo systemctl restart httpd.service

# Firewall stuff
sudo firewall-cmd --permanent --zone=public --add-service=http 
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

# Set up the database
mysql -u root -p
CREATE DATABASE wordpress;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
exit

sudo yum -y install php-gd
sudo service httpd restart

# Install Wordpress
cd ~
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
sudo rsync -avP ~/wordpress/ /var/www/html/
mkdir /var/www/html/wp-content/uploads
sudo chown -R apache:apache /var/www/html/*
cd /var/www/html
cp wp-config-sample.php wp-config.php
nano wp-config.php

8N5Ta$9tEuWhQUhv3y







