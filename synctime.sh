echo "Changing time"

echo "server pool.ntp.org" >/etc/ntp.conf
service ntp restart
