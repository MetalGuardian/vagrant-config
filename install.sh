#!/usr/bin/env bash
sudo su
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -q -y

apt-get install -y -q git nginx php5-fpm php5-cli php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-mcrypt php5-memcache php5-json phpmyadmin curl
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -q -y

cp /vagrant/www.conf /etc/php5/fpm/pool.d/
cp /vagrant/default /etc/nginx/sites-available/
cp /vagrant/custom.ini /etc/php5/mods-available/ && cd /etc/php5/fpm/conf.d/ && ln -s ../../mods-available/custom.ini ./20-custom.ini
