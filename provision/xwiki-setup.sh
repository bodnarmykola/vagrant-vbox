#!/usr/bin/env bash
sudo wget -q "http://maven.xwiki.org/public.gpg" -O- | sudo apt-key add -
sudo wget "http://maven.xwiki.org/stable/xwiki-stable.list" -P /etc/apt/sources.list.d/
sudo apt-get update
apt-get -y install xwiki-common
