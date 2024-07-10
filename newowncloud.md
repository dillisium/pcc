```
sudo -i
apt update -y
apt install apache2 -y
apt install mysql-server -y
add-apt-repository ppa:ondrej/php

apt install libapache2-mod-php7.4 php7.4-mysql php7.4-intl php7.4-zip php7.4-xml php7.4-mbstring php7.4-gd php7.4-curl -y
mysql -h database-mariadb-owncloud.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u admin -p
PCC24pcc24
CREATE DATABASE owncloud;
CREATE USER 'cloud_user'@'%' IDENTIFIED BY 'PCC/24pcc/24';
GRANT ALL PRIVILEGES ON owncloud.* TO 'cloud_user'@'%';
FLUSH PRIVILEGES;
mkdir /mnt/ownclouddata
apt install nfs-common -y
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 10.0.134.251:/ /mnt/ownclouddata
df -h
cd /var/www/html/
wget https://download.owncloud.com/server/stable/owncloud-complete-20210721.zip
apt install unzip -y
unzip owncloud-complete-20210721.zip
nano /etc/apache2/sites-available/000-default.conf
{append line '/var/www/html/' with 'owncloud'}
chown -R www-data:www-data owncloud/
//chown -R www-data:www-data /mnt/ownclouddata


cd owncloud/core/img/
wget https://mapio.net/images-p/12649552.jpg
mv background.jpg background.jpg.back
mv 12649552.jpg background.jpg
service apache2 restart






sudo -i
apt update -y
apt install docker -y
apt install docker.io -y
apt install docker-compose -y
    Dockerfile  docker-compose.yml  docker-entrypoint.sh  owncloud-apache.conf
nano Dockerfile
        # Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update -y && \
    apt-get install -y apache2 mysql-client unzip nfs-common software-properties-common wget && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get update -y && \
    apt-get install -y libapache2-mod-php7.4 php7.4-mysql php7.4-intl php7.4-zip php7.4-xml php7.4-mbstring php7.4-gd php7.4-curl

# Create and set permissions for ownCloud directory
WORKDIR /var/www/html/
RUN wget https://download.owncloud.com/server/stable/owncloud-complete-20210721.zip && \
    apt-get install -y unzip && \
    unzip owncloud-complete-20210721.zip && \
    chown -R www-data:www-data owncloud

# Download and replace the image
RUN cd /var/www/html/owncloud/core/img/ && \
    wget https://tunnelix.com/wp-content/uploads/2016/02/docker-wallpaper-black.jpg && \
    mv background.jpg background.jpg.back && \
    mv docker-wallpaper-black.jpg background.jpg

# Set the ServerName directive globally
RUN echo "ServerName 34.224.26.9" >> /etc/apache2/apache2.conf

# Copy custom Apache configuration
COPY owncloud-apache.conf /etc/apache2/sites-available/000-default.conf

# Enable site and necessary Apache modules
RUN a2enmod rewrite headers env dir mime && \
    a2ensite 000-default

# Copy entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose port 80
EXPOSE 80

# Use the entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]



    docker-compose.yml:
        GNU nano 6.2                                                                          docker-compose.yml
        version: '3.8'
        
        services:
          owncloud:
            build: .
            ports:
              - "80:80"
            volumes:
              - type: volume
                source: ownclouddata
                target: /mnt/ownclouddata
                volume:
                  nocopy: true
        
        volumes:
          ownclouddata:
            driver_opts:
              type: "nfs"
              o: "addr=10.0.134.251,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport"
              device: ":/"
        








nano docker-entrypoint.sh
#!/bin/bash

# Wait for the database to be ready
until mysql -h database-mariadb-owncloud.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u admin -pPCC24pcc24 -e "SELECT 1"; do
echo "Waiting for database connection..."
sleep 5
done

# Create the database and user if they don't exist
mysql -h database-mariadb-owncloud.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u admin -pPCC24pcc24 <<EOF
CREATE DATABASE IF NOT EXISTS owncloud;
CREATE USER IF NOT EXISTS 'cloud_user'@'%' IDENTIFIED BY 'PCC/24pcc/24';
GRANT ALL PRIVILEGES ON owncloud.* TO 'cloud_user'@'%';
FLUSH PRIVILEGES;
EOF

# Start Apache
apachectl -D FOREGROUND



nano owncloud-apache.conf
<VirtualHost *:80>
    ServerName 34.224.26.9
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/owncloud

    # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
    # error, crit, alert, emerg.
    # It is also possible to configure the loglevel for particular
    # modules, e.g.
    #LogLevel info ssl:warn

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    # For most configuration files from conf-available/, which are
    # enabled or disabled at a global level, it is possible to
    # include a line for only one particular virtual host. For example the
    # following line enables the CGI configuration for this host only
    # after it has been globally disabled with "a2disconf".
    #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet



to run docker:
docker-compose build
docker-compose up -d










генерация ключа для ссл
openssl genrsa -out haproxy.key 2048
openssl req -new -key haproxy.key -out haproxy.csr
openssl x509 -req -days 365 -in haproxy.csr -signkey  haproxy.key -out haproxy.crt
bash -c 'cat haproxy.key haproxy.crt >> /etc/ssl/private/haproxy.pem'

HAPROXY config
global
    log /dev/log    local0
    log /dev/log    local1 notice
    chroot /var/lib/haproxy
    stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
    stats timeout 30s
    user haproxy
    group haproxy
    daemon

    # Default SSL material locations
    ca-base /etc/ssl/certs
    crt-base /etc/ssl/private

    # See: https://ssl-config.mozilla.org/#server=haproxy&server-version=2.0.3&config=intermediate
    ssl-default-bind-ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHA>
    ssl-default-bind-ciphersuites TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256
    ssl-default-bind-options ssl-min-ver TLSv1.2 no-tls-tickets

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000
    timeout client  50000
    timeout server  50000
    errorfile 400 /etc/haproxy/errors/400.http
    errorfile 403 /etc/haproxy/errors/403.http
    errorfile 408 /etc/haproxy/errors/408.http
    errorfile 500 /etc/haproxy/errors/500.http
    errorfile 502 /etc/haproxy/errors/502.http
    errorfile 503 /etc/haproxy/errors/503.http
    errorfile 504 /etc/haproxy/errors/504.http

frontend http_front
    bind *:80
    redirect scheme https code 301 if !{ ssl_fc }
    bind *:443 ssl crt /etc/ssl/private/haproxy.pem
    stats uri /haproxy?stats
    default_backend http_back

backend http_back
    balance source
    option httpchk HEAD /status.php HTTP/1.1\r\nHost:\ localhost
    server lamp1 10.0.141.169:80 check
    server lamp2 10.0.141.173:80 check
    server lamp3 10.0.134.227:80 check
    server docker 10.0.134.40:80 check
```