echo "Install omf_rc"
gem install omf_rc --no-ri --no-rdoc
install_omf_rc -i -c

echo "Configuring"
echo "Default amqp server is amqp://labwiki.test.atlantis.ugent.be. This can be changed in /etc/omf_rc/config.yml"
sudo wget https://raw.githubusercontent.com/simon-vc/Thesis/master/config.yml
sudo cp config.yml /etc/omf_rc/config.yml

echo "Starting omf_rc"
sudo start omf_rc
