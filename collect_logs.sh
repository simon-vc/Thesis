echo "Getting logs"

for i in $(docker ps -aq --format {{.Names}})
do
	echo $i
done
