#!/bin/bash

# Instalação do MariaDB
sudo apt update
sudo apt install -y mariadb-server

# Configuração do MariaDB
sudo mysql_secure_installation

# Criação de banco de dados e usuário para o Grafana
sudo mysql -e "CREATE DATABASE grafana;"
sudo mysql -e "CREATE USER 'grafana'@'localhost' IDENTIFIED BY 'grafana_password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON grafana.* TO 'grafana'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Adicionando o repositório do Grafana
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Instalação do Grafana
sudo apt update
sudo apt install -y grafana

# Iniciando o serviço do Grafana
sudo systemctl start grafana-server

# Habilitando o serviço do Grafana para iniciar automaticamente com o sistema
sudo systemctl enable grafana-server

# Verificando o status do serviço do Grafana
sudo systemctl status grafana-server
