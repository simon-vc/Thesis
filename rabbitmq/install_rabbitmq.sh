echo "Installing rabbitmq-server"
sudo apt-get update
sudo apt-get -y install rabbitmq-server

echo "Download rabbitmq config script"
sudo cp ./rabbitmq/rabbitmq.config /etc/rabbitmq/rabbitmq.config
sudo service rabbitmq-server restart
