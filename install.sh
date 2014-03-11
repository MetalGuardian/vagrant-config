#!/usr/bin/env bash
sudo su
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -q -y

apt-get install -y -q mysql-server mysql-client
apt-get install -y -q git

nginx=stable # use nginx=development for latest development version
echo "deb http://ppa.launchpad.net/nginx/$nginx/ubuntu lucid main" > /etc/apt/sources.list.d/nginx-$nginx-lucid.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
apt-get install -q -y python-software-properties
add-apt-repository -y ppa:ondrej/php5
apt-get update -y

apt-get install -q -y nginx
apt-get install -q -y php5-fpm php5-cli php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-mcrypt php5-memcache php5-json phpmyadmin
apt-get install -y -q curl
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

apt-get install -y -q linux-headers-$(uname -r)
apt-get install -y -q virtualbox-guest-utils

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -q -y

cp /vagrant/www.conf /etc/php5/fpm/pool.d/
cp /vagrant/default /etc/nginx/sites-available/
cp /vagrant/custom.ini /etc/php5/mods-available/ && cd /etc/php5/fpm/conf.d/ && ln -s ../../mods-available/custom.ini ./20-custom.ini
