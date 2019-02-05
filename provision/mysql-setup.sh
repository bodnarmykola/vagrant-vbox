#!/usr/bin/env bash
sudo yum -y update
sudo yum -y install wget
wget https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
sudo rpm -Uvh mysql80-community-release-el7-2.noarch.rpm
sudo yum -y install mysql-server
sudo systemctl start mysqld
