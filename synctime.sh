echo "Changing time"

echo "server ubuntu.pool.ntp.org" >/etc/ntp.conf
service ntp restart
