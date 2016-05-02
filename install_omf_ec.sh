echo "Install ruby"
sudo apt-get update
cd
wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
tar -xzvf ruby-2.2.3.tar.gz
cd ruby-2.2.3/
./configure
make
sudo make install

cd
echo "Installing omf_ec"
sudo gem install omf_ec --no-ri --no-rdoc

echo "Downloading omf script"
sudo wget https://raw.githubusercontent.com/simon-vc/Thesis/master/vforce.rb 
sudo wget https://raw.githubusercontent.com/simon-vc/Thesis/master/collect.rb
sudo wget https://raw.githubusercontent.com/simon-vc/Thesis/master/run_ec.sh

echo "INstalling rabbitmq-server"
sudo apt-get update
sudo apt-get -y install rabbitmq-server
sudo wget https://raw.githubusercontent.com/simon-vc/Thesis/master/rabbitmq.config
sudo cp rabbitmq.config /etc/rabbitmq/rabbitmq.config
sudo service rabbitmq-server restart

echo "To run omf script using default values:"
echo "bash run_ec.sh"
