#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'