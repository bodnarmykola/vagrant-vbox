#!/usr/bin/env bash
sudo apt-get -y update && sudo apt-get -y upgrade
wget -q "https://maven.xwiki.org/public.gpg" -O- | sudo apt-key add -
sudo wget "https://maven.xwiki.org/stable/xwiki-stable.list" -P /etc/apt/sources.list.d/
sudo apt-get -y update
sudo apt-get -y install xwiki-tomcat8-common
