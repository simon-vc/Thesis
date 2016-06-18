echo "Install omf_rc"
sudo gem install omf_rc --no-ri --no-rdoc
sudo install_omf_rc -i -c

echo "Configuring"
sudo cp ./omf/config.yml /etc/omf_rc/config.yml

echo "Starting omf_rc"
sudo start omf_rc
