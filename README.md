# mysql-workshop
git clone https://github.com/imclive/mysql-workshop.git

- cd mysql-workshop

use vagrant setup 4 virtualbox vm, it will take a time to provision : main, node0, node1, node2
 - main = 192.168.50.15
 - node0 = 192.168.56.10
 - node1 = 192.168.56.11
 - node2 = 192.168.56.12
vagrant up

when all vm ready
### vagrant ssh node0
```sh
sudo /etc/rc.d/init.d/mysql bootstrap 
...
mysql -u root
grant usage on *.* to cluster@'%' identified by 'changeit';
grant all privileges on *.* to cluster@'%' identified by 'changeit';
sudo mysql_secure_installation
...
sudo cp /vagrant/node0.server.cnf /etc/my.cnf.d/server.cnf
sudo systemctl stop mysql
sudo /etc/rc.d/init.d/mysql start --wsrep-cluster-address="gcomm://"
```

### vagrant ssh node1
```sh
sudo /etc/rc.d/init.d/mysql bootstrap 
...
mysql -u root
grant usage on *.* to cluster@'%' identified by 'changeit';
grant all privileges on *.* to cluster@'%' identified by 'changeit';
sudo mysql_secure_installation
...
sudo cp /vagrant/node1.server.cnf /etc/my.cnf.d/server.cnf
sudo systemctl stop mysql
sudo systemctl start mysql
```

### vagrant ssh node2
```sh
sudo /etc/rc.d/init.d/mysql bootstrap 
...
mysql -u root
grant usage on *.* to cluster@'%' identified by 'changeit';
grant all privileges on *.* to cluster@'%' identified by 'changeit';
sudo mysql_secure_installation
...
sudo cp /vagrant/node2.server.cnf /etc/my.cnf.d/server.cnf
sudo systemctl stop mysql
sudo systemctl start mysql
```
### return to node0 -> vagrant ssh node0
```sh
sudo systemctl restart mysql
```

### vagrant ssh main
```sh
sudo yum install -y haproxy keepalive
sudo cp /vagrant/haproxy.cfg /etc/haproxy/
sudo cp /vagrant/keepalived.conf /etc/keepalived/
sudo systemctl start haproxy
sudo systemctl start keepalive
```



