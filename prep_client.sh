echo "Client preperations"

echo "Install Docker"
curl -fsSL https://get.docker.com/ | bash

echo "Getting create_containers script"
wget https://raw.githubusercontent.com/simon-vc/Thesis/master/create_containers.sh

echo "Getting client_file"
wget https://raw.githubusercontent.com/simon-vc/Thesis/master/client_config.ini

echo "Getting run_containers script"
wget https://raw.githubusercontent.com/simon-vc/Thesis/master/run_containers.sh

echo "Getting collect_logs script"
wget https://raw.githubusercontent.com/simon-vc/Thesis/master/collect_logs.sh

echo "Getting cpu, mem and disk logging script"
wget https://raw.githubusercontent.com/simon-vc/Thesis/master/run_logging.sh
