# NOTE commands were edited and not all commands from sources were used, so links are here only for reference and information
## Links for sources 
owncloud installation
https://docs.vultr.com/how-to-install-and-configure-owncloud-on-ubuntu-20-04
LAMP
https://www.digitalocean.com/community/tutorials/how-to-install-lamp-stack-on-ubuntu



```
pcc-admin
pcc/24
sudo -i
pcc/24
hostname [name]
nano /etc/hosts 
```
## file changing
	127.0.1.1 [hostname]
	ctrl + x, y, enter
```
nano /etc/netplan/00-installer-config.yaml
```
## file changing

	ens18:
		addresses:
		[ip address]
	ctrl + x, y, enter
```	
netplan apply
shutdown now
```
## (включить, залогиниться)
```
pcc-admin
pcc/24
apt update
apt install apache2
y
apt install mysql-server
y
mysql_secure_installation
Y
0
Y
Y
Y
Y
mysql
```
## ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
## Now we can login with `mysql -p` and entering password
```
mysql -p
password
exit
apt install php
y
apt install libapache2-mod-php php-mysql 
y
apt install phpmyadmin
y
```
## space, enter, No, enter
```
nano /var/www/html/info.php
```
## put that into file
```
<?php
phpinfo();
?>
```
## ctrl + x, y, enter
```
service apache2 restart
```
## now we are able to see our info page at ip address/info.php
```
nano /etc/environment
```
## insert this lines below first line
```
http_proxy=http://proxy.hof-university.de:3128/
https_proxy=http://proxy.hof-university.de:3128/
ftp_proxy=http://proxy.hof-university.de:3128/
HTTP_PROXY=http://proxy.hof-university.de:3128/
HTTPS_PROXY=http://proxy.hof-university.de:3128/
FTP_PROXY=http://proxy.hof-university.de:3128/
```
```
apt install php-intl
y
mysql -u root -p
password
CREATE DATABASE owncloud;
CREATE USER 'cloud_user'@'localhost' IDENTIFIED BY 'PCC/24pcc/24';
GRANT ALL PRIVILEGES ON owncloud.* TO 'cloud_user'@'localhost';
FLUSH PRIVILEGES;
exit
wget https://download.owncloud.com/server/stable/owncloud-complete-20210721.zip
apt install unzip
unzip owncloud-complete-20210721.zip
chown -R www-data:www-data owncloud/
service apache restart
```
## Create admin account
login `owncloudadmin`
pass `PCC/24pcc/24`
database user `cloud_user`
database table name `owncloud`
database user pass `PCC/24pcc/24`
## config for new ip
```
nano /var/www/html/owncloud/config/config.php
```
  array (                                                                                                                   0 => '192.168.67.21',                                                                                                 ),                                                                                                                      'datadirectory' => '/var/www/html/owncloud/data',                                                                       'overwrite.cli.url' => 'http://192.168.67.21',                                                                          'dbtype' => 'mysql',                             
  ```
  service apache2 restart
  ```
  