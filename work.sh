echo "Starting Servis..."
cd /var/lib/bareos

/usr/sbin/bareos-dir -t -f && /usr/sbin/bareos-dir && echo 'bareos-dir started' &&\
/usr/sbin/bareos-sd && /usr/sbin/bareos-fd && /usr/sbin/httpd &&\
while :
do
   sleep 1
done
echo "Exit"
