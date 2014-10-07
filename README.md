vagrant-config
==============

# Requirements
--------------

installed [VirtualBox](https://www.virtualbox.org/), [vagrant](http://www.vagrantup.com/).

# Setup vagrant
-------

`synced_folder` - synced folder from host machine, will contains source codes, by default "./" means that current directory will be used as "/web". you can change this option to "/var/www" or other path.

`--memory` - virtual machine memory limit, by default 512 Mb

`--name` - virtual box machine name, by default "vintage-vm-clean"

`:ip` - ip of the virtual machine, by default 192.168.56.101

# Setup host machine
--------------------

install `dnsmasq` to add capability resolve `*.dev` domains by virtual machine against add domains in `hosts`

```
apt-get install dnsmasq
echo "address=/.dev/192.168.56.101" >> /etc/dnsmasq.conf
```

use IDE to develop, backup old projects form synced folder to prevent slow virtual machine working


# Known bugs
------------

1. if you have broken static files - in `/etc/nginx/nginx.conf` change `sendfile off`;

2. install `vagrant-vbguest` : `vagrant plugin install vagrant-vbguest`. this plugin install required guest drivers automatically

# Hints

if you want login in phpmyadmin automatically - add lines to `/etc/phpmyadmin/config.inc.php`:

```
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['username'] = 'root';
$cfg['Servers'][$i]['password'] = '';
```

add this line `$cfg['Servers'][$i]['AllowNoPassword'] = TRUE;` if you have empty user password

