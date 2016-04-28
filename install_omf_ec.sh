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
wget https://raw.githubusercontent.com/simon-vc/Thesis/master/vforce.rb 

echo "To run omf script using default values:"
echo "omf_ec -u amqp://labwiki.test.atlantis.ugent.be vforce.rb"
