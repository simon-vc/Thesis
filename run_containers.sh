echo "Starting Docker containers"

N=3
echo "Using default: $N containers"

SECONDS=0
for ((i=1 ; i<=$N ; i++))
do
	echo "Starting container$i"
	docker run -d -v /etc/localtime:/etc/localtime:ro --name client$i simonvancauter/vfclient /bin/bash -c "cd client/ ./client client_config_http1.ini
	echo "Container $i started"
	sleep $(( ( $RANDOM % 10 )  + 1 ))s
	
done
echo "\n\n$SECONDS elapsed"
