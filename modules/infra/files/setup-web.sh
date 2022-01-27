#!/bin/bash
apt update
apt install -y nginx git maven default-jdk-headless
mkdir -p /var/www/html

systemctl start nginx
touch  /var/www/html/healthstatus

cat << EOF > /etc/nginx/conf.d/reverse.conf
server {
    listen       80;

    location /healthstatus {
        access_log off;
        return 200;
    }
     
    location / {
        proxy_pass                   http://localhost:8080/; 
    }
}
EOF

systemctl enable nginx