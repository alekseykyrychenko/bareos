echo "Starting Servis..."

echo 'StartServers 2
MinSpareServers 2' >> /etc/httpd/conf.modules.d/00-mpm.conf

sed -i 's/.*diraddress = .*/diraddress = "'${HOST}'"/' /etc/bareos-webui/directors.ini

/usr/sbin/httpd && echo OK

while :
do
   sleep 1
done
echo "Exit"
