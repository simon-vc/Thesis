while true
do
  clear
  echo "Container: Status"
  echo "==================================================="
  docker ps -a --format "{{.Names}}: {{.Status}}"
  sleep 5
done
