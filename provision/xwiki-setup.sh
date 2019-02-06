#!/usr/bin/env bash
sudo apt-get -y update && sudo apt-get -y upgrade
wget -q "https://maven.xwiki.org/public.gpg" -O- | sudo apt-key add -
sudo wget "https://maven.xwiki.org/stable/xwiki-stable.list" -P /etc/apt/sources.list.d/
sudo apt-get -y update
sudo apt-get -y install xwiki-tomcat8-common
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java_8.0.15-1ubuntu18.04_all.deb
mkdir mysqldrv
dpkg-deb -x mysql-connector-java_8.0.15-1ubuntu18.04_all.deb ./mysqldrv/
sudo cp ./mysqldrv/usr/share/java/mysql-connector-java-8.0.15.jar /usr/lib/xwiki/WEB-INF/lib
sudo echo '<?xml version="1.0" encoding="UTF-8"?>


<!DOCTYPE hibernate-configuration PUBLIC
  "-//Hibernate/Hibernate Configuration DTD//EN"
  "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
  <session-factory>

    <property name="show_sql">false</property>
    <property name="use_outer_join">true</property>

    <property name="jdbc.use_scrollable_resultset">false</property>

    <property name="dbcp.defaultAutoCommit">false</property>
    <property name="dbcp.maxTotal">50</property>
    <property name="dbcp.maxIdle">5</property>
    <property name="dbcp.maxWaitMillis">30000</property>
    <property name="connection.provider_class">com.xpn.xwiki.store.DBCPConnectionProvider</property>

    <property name="connection.url">jdbc:mysql://192.168.1.20/xwiki?useSSL=false</property>
    <property name="connection.username">xwiki</property>
    <property name="connection.password">xwiki</property>
    <property name="connection.driver_class">com.mysql.jdbc.Driver</property>
    <property name="dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
    <property name="dbcp.poolPreparedStatements">true</property>
    <property name="dbcp.maxOpenPreparedStatements">20</property>

    <property name="hibernate.connection.charSet">UTF-8</property>
    <property name="hibernate.connection.useUnicode">true</property>
    <property name="hibernate.connection.characterEncoding">utf8</property>

    <mapping resource="xwiki.hbm.xml"/>
    <mapping resource="feeds.hbm.xml"/>
    <mapping resource="activitystream.hbm.xml"/>
    <mapping resource="instance.hbm.xml"/>
    <mapping resource="notification-filter-preferences.hbm.xml"/>
    <mapping resource="mailsender.hbm.xml"/>

  </session-factory>
</hibernate-configuration>' >> /etc/xwiki/hibernate.cfg.xml
sudo systemctl restart tomcat8
