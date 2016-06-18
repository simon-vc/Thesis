N=1

#Read arguments
while [[ $# > 1 ]]
do
key="$1"

case $key in
    -n|--number)
    N="$2"
	    if [[ $2 -lt 1 ]]
    	then
    		echo "Iterations must be larger than 0"
    		echo "Using default: 1"
    		N=1
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

for ((i=1 ; i<=$N ; i++))
do
  echo "Iteration $i"
  bash run_ec.sh
done
