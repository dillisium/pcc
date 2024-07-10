 ```
 1  ls
    2  ip addr
    3  cat /etc/haproxy/haproxy.cfg
    4  sudo nano /etc/haproxy/haproxy.cfg
    5  cat /etc/haproxy/haproxy.cfg
    6  ls -lah
    7  nano lamp1.pem
    8  cat lamp1.pem
    9  ls
   10  nano lamp2.pem
   11  cat lamp2.pem
   12  exit
   13  cat lamp2.pem
   14  cat lamp1.pem
   15  nano lamp1.pem
   16  nano lamp2.pem
   17  cat lamp1.pem
   18  curl 10.0.3.131
   19  curl http://10.0.3.131
   20  exit
   21  cat lamp2.pem
   22  clear
   23  ls
   24  ssh -i lamp1.pem ubuntu@54.167.55.147
   25  ip addr
   26  hostname -I
   27  hostname
   28  ssh -i lamp1.pem ubuntu@10.0.3.131
   29  ls
   30  chmod 400 lamp1.pem
   31  ssh -i lamp1.pem ubuntu@10.0.3.131
   32  ls -lah
   33  ssh -i lamp1.pem ubuntu@10.0.3.131
   34  exit
   35  systemctl restart haproxy
   36  apt list
   37  ssh -i lamp1.pem ubuntu@10.0.3.131
   38  apt-get update -y
   39  apt-get upgrade -y
   40  apt-get update -y
   41  apt-get upgrade -y
   42  sudo apt-get upgrade -y
   43  sudo dpkg --configure -a
   44  sudo apt-get upgrade -y
   45  apt-get install -y haproxy
   46  sudo apt-get upgrade -y
   47  apt --fix-broken install
   48  sudo apt-get upgrade -y
   49  apt-get install -y haproxy
   50  clear
   51  apt-get update -y
   52  sudo apt-get upgrade -y
   53  apt udpate
   54  sudo apt update
   55  sudo apt --fix-broken install
   56  apt upgrade
   57  apt-get install haproxy
   58  haproxy ?
   59  apt install haproxy
   60  systemctl restart haproxy
   61  sudo apt install -y haproxy
   62  exit
   63  ssh -i lamp1.pem ubuntu@10.0.3.131
   64  apt update
   65  apt list --upgradable
   66  apt install -y haproxy
   67  apt --fix-broken install
   68  sudo apt clean
   69  sudo apt autoclean
   70  sudo apt update
   71  sudo apt --fix-broken install
   72  sudo apt upgrade
   73  sudo apt install -y haproxy
   74  sudo apt install -y liblua5.3-0
   75  sudo apt install -y haproxy
   76  sudo apt install -y liblua5.3-0
   77  apt install -y msodbcsql17
   78  sudo apt install -y haproxy
   79  systemctl restart haproxy
   80  cat <<EOF > /etc/haproxy/haproxy.cfg
   81  global
   82      log /dev/log    local0
   83      log /dev/log    local1 notice
   84      maxconn 4096
   85      user haproxy
   86      group haproxy
   87      daemon
   88  defaults
   89      log global
   90      mode http
   91      option httplog
   92      option dontlognull
   93      timeout connect 5000
   94      timeout client  50000
   95      timeout server  50000
   96  frontend http_front
   97      bind *:80
   98      stats uri /haproxy?stats
   99      default_backend http_back
  100  backend http_back
  101      balance roundrobin
  102      server lamp1 10.0.3.131:80 check
  103      server lamp2 10.0.4.6:80 check
  104  EOF
  105  systemctl restart haproxy
  106  cat /etc/haproxy/haproxy.cfg
  107  sudo systemctl start haproxy
  108  sudo systemctl enable haproxy
  109  sudo systemctl status haproxy
  110  history
  ```