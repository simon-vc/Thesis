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
sudo cp config.yml /etc/omf_rc/config.yml

echo "Starting omf_rc"
sudo start omf_rc
