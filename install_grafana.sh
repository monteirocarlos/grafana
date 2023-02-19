sudo apt update
sudo apt install -y mariadb-server
sudo mysql_secure_installation
sudo mysql -e "CREATE DATABASE grafana;"
sudo mysql -e "CREATE USER 'grafana'@'localhost' IDENTIFIED BY 'grafana_password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON grafana.* TO 'grafana'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt update
sudo apt install -y grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
sudo systemctl status grafana-server
