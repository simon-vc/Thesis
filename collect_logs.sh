echo "Getting logs"

FOUND=false
ITERATIE=0
DC=~/logs
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
	mkdir ~/logs/
fi
mkdir ~/logs/log$ITERATIE/

for i in $(docker ps -aq --format {{.Names}})
do
	echo $i
	docker cp $i:/var/www/html/log_client/ ~/logs/log$ITERATIE/$i/
done
