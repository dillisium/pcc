 apt update
 apt install apache2 -y
  
```
  1  apt update
    2  apt install apache2 -y

    3  apt install php -y
    4  apt install libapache2-mod-php php-mysql
    5  apt install php-intl
    6  nano /var/www/html/
    7  nano /var/www/html/info.php
    8  service apache2 restart
    9  mysql
   10  mariadb
   11  nano /etc/hosts
   12  mysql -h database-1.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u a                                                                                                             dmin -p
   13  mysql -hdatabase-1.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u ad                                                                                                             min -p
   14  mariadb -hdatabase-1.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u                                                                                                              admin -p
   15  mysql -h database-1.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u a                                                                                                             dmin -p
   16  apt install maradb
   17  apt install mysql
   18  apt update
   19  apt install mysql
   20  apt install mysql-server
   21  mysql -h database-1.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u a                                                                                                             dmin -p
   22  куищще
   23  reboot
   24  mysql -h database-1.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u a                                                                                                             dmin -p
   25  wget https://download.owncloud.com/server/stable/owncloud-complete-202107                                                                                                             21.zip
   26  mv owncloud-complete-20210721.zip /var/www/html
   27  cd /var/www/html/
   28  ls
   29  unzip owncloud-complete-20210721.zip
   30  apt install unzip
   31  unzip owncloud-complete-20210721.zip
   32  chown -R www-data:www-data owncloud/
   33  nano /etc/apache2/sites-available/000-default.conf
   34  service apache2 restart
   35  apt remove php
   36  apt install php7.4
   37  sudo add-apt-repository ppa:ondrej/php
   38  sudo apt update
   39  sudo apt install php7.4
   40  service apache2 restart
   41  apt remove libapache2-mod-php php-mysql
   42  apt remove phpmyadmin
   43  apt remove php-intl
   44  apt autoremove
   45  sudo apt install libapache2-mod-php7.4 php7.4-mysql php7.4-intl
   46  sudo apt install phpmyadmin
   47  nano /var/www/html/info.php
   48  service apache2 restart
   49  a2enmod php7.4
   50  service apache2 restart
   51  apt install php7.4-zip php7.4-xml php7.4-mbstring php7.4-gd php7.4-curl -                                                                                                             y
   52  service apache2 restart \
   53  service apache2 restart
   54  mysql -h database-1.ckm92dhbcoyf.us-east-1.rds.amazonaws.com -P 3306 -u a                                                                                                             dmin -p
   55  service apache2 restart
   56  cd /
   57  mkdir /ownclouddata
   58  ls
   59  apt install amazon-efs-utils
   60  sudo mount -t efs -o tls fs-0015d4d73ec15eb36:/ efs
   61  sudo mount -t efs -o tls fs-0015d4d73ec15eb36:/ /ownclouddatasudo apt-get                                                                                                              install -y amazon-efs-utils
   62  sudo apt-get install -y amazon-efs-utils
   63  sudo apt-get install -y nfs-common
   64  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=                                                                                                             600,retrans=2,noresvport 172.31.24.55:/ ownclouddata
   65  mount -t nfs4 -o nfsvers=4.1 172.31.24.55:/ /ownclouddata
   66  mount -t nfs4 -o nfsvers=4.1 172.31.59.138
   67  :/ /ownclouddata
   68  mount -t nfs4 -o nfsvers=4.1 172.31.59.138:/ /ownclouddata
   69  ls
   70  cd ownclouddata/
   71  ls
   72  touch hui.txt
   73  nano hui.txt
   74  df -h
   75  umount /ownclouddata
   76  cd ../
   77  umount /ownclouddata
   78  df -h
   79  mount -t nfs4 -o nfsvers=4.1 172.31.59.138:/ /ownclouddata
   80  umount /ownclouddata
   81  ls
   82  cd ownclouddata/
   83  ls
   84  rmdir ownclouddata
   85  rmdir ownclouddata
   86  ls
   87  mount -t nfs4 -o nfsvers=4.1 172.31.59.138:/ /ownclouddata
   88  ls
   89  mdkir /ownclouddata
   90  ls
   91  mkdir /ownclouddata
   92  cd /ownclouddata/
   93  ls
   94  mount -t nfs4 -o nfsvers=4.1 172.31.59.138:/ /ownclouddata
   95  ls
   96  mount -t nfs4 -o nfsvers=4.1 172.31.59.138:/ /ownclouddata
   97  umount /ownclouddata
   98  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=                                                                                                             600,retrans=2,noresvport 172.31.59.138:/ efs
   99  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=                                                                                                             600,retrans=2,noresvport 172.31.59.138:/ ownclouddata
  100  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=                                                                                                             600,retrans=2,noresvport 172.31.59.138:/ /ownclouddata
  101  ls
  102  touch lol.txt
  103  nano lol.txt
  104  df -h
  105  ls
  106  umount /ownclouddata
  107  ls
  108  rm lol.txt
  109  cd ../
  110  rmdir /o
  111  rmdir /ownclouddata/
  112  mkdir -p /mnt/ownclouddata
  113  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=                                                                                                             600,retrans=2,noresvport 172.31.59.138:/ /mnt/ownclouddata/
  114  df -h
  115  cd /mnt/ownclouddata/
  116  ls
  117  nano hui/txt
  118  nano hui.txt
  119  touch lol.txt
  120  nano ;
  121  nano lol.txt
  122  unmount /mnt/ownclouddata/
  123  cd ../../
  124  umount /mnt/ownclouddata
  125  ls
  126  cd /mnt
  127  ls
  128  cd /ownclouddata
  129  cd ownclouddata
  130  ls
  131  cd ownclouddata/
  132  cd ownclouddata
  133  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=                                                                                                             600,retrans=2,noresvport 172.31.59.138:/ /mnt/ownclouddata/
  134  ls
  135  cd ../
  136  ls
  137  cd ownclouddata/
  138  ls
  139  cd /var/www/html/owncloud/
  140  ls
  141  cd config/
  142  ls
  143  nano config.php
  144  service apache2 restart
  145  history
```