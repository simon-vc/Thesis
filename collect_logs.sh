echo "Getting logs"

FOUND=false
ITERATIE=0
DC=logs
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
sudo cp cpu.log logs/log$ITERATIE/
sudo rm cpu.log
sudo cp mem.log logs/log$ITERATIE/
sudo rm mem.log
sudo cp disk.log logs/log$ITERATIE/
sudo rm disk.log


echo "Collect container logs"
for i in $(docker ps -aq --format {{.Names}})
do
	echo $i
	docker cp $i:/var/www/html/log_client/ $DC/log$ITERATIE/$i/
done
