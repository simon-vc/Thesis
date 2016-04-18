echo "Starting Docker containers"

N=5
echo "Using default: $N containers"

SECONDS=0
for ((i=1 ; i<=$N ; i++))
do
	echo "Starting container$i"
	docker run -d -v /etc/localtime:/etc/localtime:ro --name client$i simonvancauter/vfclient /bin/bash -c "cd client/ ; export LD_LIBRARY_PATH=bin:/usr/lib ; ./client client_config_http1.ini"
	echo "Container $i started"
	sleep $(( ( $RANDOM % 10 )  + 1 ))s
	
done
echo "\n\n$SECONDS elapsed"
