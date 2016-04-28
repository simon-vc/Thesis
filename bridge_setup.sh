echo "Bridge setup"

brctl addbr br0
brctl addif br0 eth1 eth4
ifconfig eth1 0.0.0.0
ifconfig eth4 0.0.0.0
ifconfig br0 10.0.0.10 netmask 255.255.255.0 up
