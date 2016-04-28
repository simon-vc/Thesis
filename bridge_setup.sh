echo "Bridge setup"

sudo apt-get install -y bridge-utils
sudo brctl addbr br0
sudo brctl addif br0 eth1 eth4
sudo ifconfig eth1 0.0.0.0
sudo ifconfig eth4 0.0.0.0
sudo ifconfig br0 10.0.0.10 netmask 255.255.255.0 up
