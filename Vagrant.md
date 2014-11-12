# CentOS 6.5 LAMP - Vagrant Box

A Vagrant box that recreates the server setup of many shared hosting companies (e.g. UKHost4u)

## Includes

*   Apache 2.2.15
*   PHP 5.3.28
*   MySQL 5.5.36

## Included Packages

*   `php-mysqli`
*   `php-pdo`
*   `php-xml`

## Apache settings:

In `/etc/httpd/conf/httpd.conf`:

*   `ServerName vagrant.dev`
*   `User vagrant`
*   `Group vagrant`
*   `AllowOverride All` - allows `.htaccess` overrides
*   `DocumentRoot "/var/www/public"`
*   `EnableSendfile off` - avoids issues with mounted file systems

## php.ini settings:

In `/etc/php.ini`:

*   `error_log /vagrant/php_errors.log`

## Vagrant Setup

Apache will run from `/var/www/public`. You'll need to use synced folders:

    `
    config.vm.synced_folder "./", "/var/www"
    `

    The following settings are also useful:

    `config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 512] # Set memory to 512MB
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"] # Use NAT DNS host resolver
        end
    `

    ## Remote Connection to MySQL

    Use SSH with the following settings:

*   MySQL Host: `127.0.0.1`
*   MySQL Username: `root`
*   MySQL Password:
*   SSH Host: `127.0.0.1`
*   SSH User: `vagrant`
*   SSH Key File: `~/.vagrant.d/insecure_private_key`
*   SSH Port: `2222`

    Recommend [Sequel Pro](http://www.sequelpro.com) for the Mac.

    ## CentOS MySQL Issue

    CentOS can do weird stuff with the MySQL socket. If you're having issues with MySQL loading try:

    `sudo mv /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock.bak
        sudo service mysqld start
    `

    or from the host machine:

    `vagrant ssh -c "sudo mv /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock.bak; sudo service mysqld start"`