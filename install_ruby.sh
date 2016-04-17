echo "Install ruby"

sudo apt-get update
sudo apt-get -y install ruby-dev build-essential libssl-dev
cd
wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
tar -xzvf ruby-2.2.3.tar.gz
cd ruby-2.2.3/
./configure
make
echo "Installing ruby"
sudo make install
