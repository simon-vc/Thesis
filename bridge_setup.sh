if [ $# -ne 2 ]
  then
    echo "Use $0 interface1 interface2"
    exit
fi

$IF1=$1
$IF2=$2

echo "Bridge setup"
sudo brctl addbr br0
sudo brctl addif br0 $IF1 $IF2
sudo ifconfig $IF1 0.0.0.0
sudo ifconfig $IF2 0.0.0.0
sudo ifconfig br0 10.0.0.10 netmask 255.255.255.0 up
