#Default values
#Amount of containers
N=1
#Random sleep time between container starts
SLEEPTIME=0

#Read arguments
while [[ $# > 1 ]]
do
key="$1"

case $key in
    -n|--number)
    N="$2"
	if [[ $2 -lt 1 ]]
	then
		echo "Amount of containers must be larger than 0"
		echo "Using default: 1"
		N=1
	fi
    shift
    ;;
    -s|--sleep)
    SLEEPTIME="$2"
		if [[ $SLEEPTIME -ge 0 ]]
		then
			echo "Random sleeptime set between 1 and $SLEEPTIME"
		else
			echo "Sleeptime must be positive"
			SLEEPTIME=0
		fi
    shift
    ;;
    *)
		echo "Argument not recognized"
		# unknown option
    ;;
esac
shift
done

echo "Start logging cpu, mem and disk usage"
echo "===================================="
bash run_logging.sh &


echo "Starting Docker containers"
echo "Amount: $N"
echo "===================================="

SECONDS=0
for ((i=1 ; i<=$N ; i++))
do
        echo "Starting container$i"
        docker start client$i
        if [[ $i -ne $N ]]
                then
                        if [[ $SLEEPTIME -gt 0 ]]
                        then
                                echo "Sleep"
                                sleep $(( ( $RANDOM % $SLEEPTIME )  + 1 ))s
                        fi
        fi
done
echo "===================================="
echo "$SECONDS elapsed"
