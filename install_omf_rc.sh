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
echo "Install omf_rc"
sudo gem install omf_rc --no-ri --no-rdoc
sudo install_omf_rc -i -c

echo "Configuring"
echo "Default amqp server is amqp://labwiki.test.atlantis.ugent.be. This can be changed in /etc/omf_rc/config.yml"
sudo wget https://raw.githubusercontent.com/simon-vc/Thesis/master/config.yml
sudo cp config.yml /etc/omf_rc/config.yml

echo "Starting omf_rc"
sudo start omf_rc
