#!/bin/bash
  
while :
  do
     echo '-'
     if [[ -f /etc/bareos/bconsole.conf ]]; then break; fi
     sleep 5
  done

chown bareos.bareos /var/lib/bareos/storage
chmod 775 /var/lib/bareos/storage 
echo "Starting Servis..."
cd /var/lib/bareos
/usr/sbin/bareos-sd

rm -rf /tmp/bareos

while :
do
   sleep 1
done
echo "Exit"
