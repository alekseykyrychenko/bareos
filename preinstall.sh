echo "Generating mysql config file..."
if [[ ! -f /etc/bareos/bconsole.conf ]];
 do
  mv /etc/kubeconfig/* /etc/bareos/
  cat mysql_client.cnf > /etc/my.cnf.d/client.cnf
  cat mysql_MyCatalog.conf > /etc/bareos/bareos-dir.d/catalog/MyCatalog.conf
  for FILE in '/etc/my.cnf.d/client.cnf' '/etc/bareos/bareos-dir.d/catalog/MyCatalog.conf'
   do
     echo 'Set ENV for: '${FILE}
     sed -i "s/{DATABASE}/${DATABASE}/" ${FILE}
     sed -i "s/{USER}/${USER}/" ${FILE}
     sed -i "s/{PASSWORD}/${PASSWORD}/" ${FILE} 
   done
 fi
chown bareos.bareos /var/lib/bareos/storage
chmod 775 /var/lib/bareos/storage 
