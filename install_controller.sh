echo "Controller installation"

echo "Install RabbitMQ"
bash ./rabbitmq/install_rabbitmq.sh

echo "Install Ruby"
bash ./omf/install_ruby.sh

echo "Install OMF RC"
bash ./omf/install_omf_ec.sh