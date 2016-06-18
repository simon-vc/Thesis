if [ $# -ne 1 ]
  then
    echo "Use $0 interface"
    exit
fi

tc qdisc add dev $1 root handle 1: htb default 10
tc class add dev $1 parent 1: classid 1:10 htb rate 125kbps