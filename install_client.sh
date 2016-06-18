echo "Client installation"

echo "Installing Docker"
curl -fsSL https://get.docker.com/ | bash

echo "Install sysstat"
bash ./client/install_systat.sh

echo "Install Ruby"
bash ./omf/install_ruby.sh

echo "Install OMF RC"
bash ./omf/install_omf_rc.sh