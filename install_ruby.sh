echo "Install ruby"

sudo apt-get update
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update

sudo apt-get -y install build-essential libssl-dev
sudo apt-get -y install ruby2.2 ruby2.2-dev
