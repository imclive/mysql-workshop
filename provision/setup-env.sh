#!/bin/bash
sudo cp /vagrant/mariadb.repo /etc/yum.repos.d/
sudo yum update
sudo yum install -y MariaDB-Galera-server  MariaDB-client galera