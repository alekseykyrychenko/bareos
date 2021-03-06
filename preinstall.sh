echo "Generating mysql config file..."
if [[ ! -f /etc/bareos/bconsole.conf ]];
 then
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
  while :
  do
     echo 'Conect to database'
     /usr/lib/bareos/scripts/make_bareos_tables && break
     sleep 5
     echo 'Error. Reconect...'
  done
  echo 'OK' 
  rm -f /etc/bareos/bareos-dir.d/console/admin.conf
  sed -i 's/.*Address =.*/  Address = sd-bareos/' /etc/bareos/bareos-dir.d/storage/File.conf
  mv webui-admin.conf /etc/bareos/bareos-dir.d/profile/webui-admin.conf
 fi
