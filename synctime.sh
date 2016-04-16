echo "Changing time"

echo "ubuntu.pool.ntp.org" >/etc/ntp.conf
service ntp restart
