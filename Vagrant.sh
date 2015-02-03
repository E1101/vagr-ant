#!/bin/sh

# Remember To ShutDown "selinux"
if [ -f "/var/vagrant_provision" ]; then
    exit 0
fi

echo "(o) Installing Apache and setting it up..."
yum -y install httpd
systemctl start httpd.service
echo "... enable Apache"
systemctl enable httpd.service >/dev/null 2>&1

echo "(o) Installing MariaDB and setting it up..."
yum -y install mariadb-server mariadb
systemctl start mariadb
echo "... enable mySql"
systemctl enable mariadb.service >/dev/null 2>&1

echo "(o) Installing PHP 5.4"
yum -y install php php-mysql
systemctl restart httpd.service


