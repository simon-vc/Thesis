echo "Getting logs"

DATE=$(date +%Y%m%d_%H%M%S)
mkdir ~/logs
mkdir ~/logs/log_$DATE
for i in $(docker ps -aq --format {{.Names}})
do
	echo $i
	docker cp "$i:/var/www/html/log_client/" "~/logs/logs_$DATE/$i/"
done
