#!/bin/bash

# MySQL root password
ROOTNAME="root"
ROOTPASS=""

if [ ! $1 ] ; then
        echo "no argument provided"
        exit 0
fi

echo $1

read -p "Database name (same as user name): " DBNAME
if [ "$DBNAME" = "" ]; then
	printf "Error: you have to input database name!\n"
	exit 1
fi
echo $DBNAME;

read -p "Database user password: " MYSQLPASS
if [ "$MYSQLPASS" = "" ]; then
        printf "Error: you have to input database user password!\n"
        exit 1
fi
echo $MYSQLPASS;


MYSQLPASS=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c5`

echo "Creating database"

Q1="CREATE DATABASE IF NOT EXISTS $USERNAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
Q2="GRANT ALL PRIVILEGES ON $USERNAME.* TO '$USERNAME'@'%' IDENTIFIED BY '$MYSQLPASS';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

#mysql --user=$ROOTNAME --password=$ROOTPASS -e "$SQL"
