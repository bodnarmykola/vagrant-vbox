#!/bin/bash
sudo yum -y update
sudo yum -y install wget
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -Uvh mysql-community-release-el7-5.noarch.rpm
sudo yum -y update
sudo yum -y install mysql-server
sudo systemctl start mysqld
mysql -u root -e "create database xwiki default character set utf8 collate utf8_bin"
mysql -u root -e "grant all privileges on *.* to xwiki@192.168.1.10 identified by 'xwiki'"
