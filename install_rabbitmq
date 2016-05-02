echo "Installing rabbitmq-server"
sudo apt-get update
sudo apt-get -y install rabbitmq-server

echo "Download rabbitmq config script"
sudo wget https://raw.githubusercontent.com/simon-vc/Thesis/master/rabbitmq.config
sudo cp rabbitmq.config /etc/rabbitmq/rabbitmq.config
sudo service rabbitmq-server restart
