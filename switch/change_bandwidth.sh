if [ $# -ne 2 ]
  then
    echo "Use $0 interface bandwidth"
    exit
fi

tc class change dev $1 parent 1: classid 1:10 htb rate ($2)kbps