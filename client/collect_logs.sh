echo "Getting logs"

FOUND=false
ITERATIE=0
DC=logs

#Find current iteration
while [ $FOUND != true ]
do
	if [ -d "$DC/log$ITERATIE" ]
	then
		((ITERATIE+=1))
	else
		FOUND=true
	fi
done

echo "Iteratie $ITERATIE"
if [ ! -d "$DC" ]
then
	mkdir logs/
fi

mkdir logs/log$ITERATIE/

echo "Collect cpu, mem and disk logs"
sudo mv cpu.log logs/log$ITERATIE/
sudo mv mem.log logs/log$ITERATIE/
sudo mv disk.log logs/log$ITERATIE/

echo "Collect container logs"
for i in $(docker ps -aq --format {{.Names}})
do
	echo $i
	docker cp $i:/var/www/html/log_client/ $DC/log$ITERATIE/$i/
done
