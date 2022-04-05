#!/bin/bash

yum install httpd -y
echo "${file_content}!" > /var/www/html/index.html
chekconfig httpd on
service httpd start 