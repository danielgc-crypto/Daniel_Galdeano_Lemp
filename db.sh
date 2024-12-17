#!/bin/bash

# Actualizar repositorios e instalar MariaDB
sudo apt update -y
sudo apt install -y mariadb-server

# Definir en maraidb por la interfaz de red que va a salir
sed -i 's/bind-address.*/bind-address = 192.168.60.10/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Reiniciar MariaDB
sudo systemctl restart mariadb

# Crear base de datos y usuario para OwnCloud
mysql -u root <<EOF
CREATE DATABASE owncloud_db;
CREATE USER 'DaniG'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON owncloud_db.* TO 'DaniG'@'%';
FLUSH PRIVILEGES;
EOF

