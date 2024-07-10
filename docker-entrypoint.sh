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