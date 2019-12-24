echo "Generating mysql config file..."
cat mysql_client.cnf > /etc/my.cnf.d/client.cnf
cat mysql_MyCatalog.conf > /etc/bareos/bareos-dir.d/catalog/MyCatalog.conf
for FILE in '/etc/my.cnf.d/client.cnf' '/etc/bareos/bareos-dir.d/catalog/MyCatalog.conf'
do
 echo 'Set ENV for: '${FILE}
 sed -i "s/{DATABASE}/${DATABASE}/" ${FILE}
 sed -i "s/{USER}/${USER}/" ${FILE}
 sed -i "s/{PASSWORD}/${PASSWORD}/" ${FILE} 
done
