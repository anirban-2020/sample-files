
#!/bin/bash
yum install -y httpd php git

cd /var/www/html

wget https://github.com/anirban-2020/sample-files/blob/master/4x4-pic1.jpg    

mv 4x4-pic1.jpg  4x4-pic.jpg

wget https://github.com/anirban-2020/sample-files/blob/master/index.php

mv /var/www/html/htaccess /var/www/html/.htaccess

mkdir /var/www/html/4x4

cp /var/www/html/4x4-pic.jpg /var/www/html/4x4
cp /var/www/html/index.php /var/www/html/4x4
cp /var/www/html/.htaccess /var/www/html/4x4

sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;