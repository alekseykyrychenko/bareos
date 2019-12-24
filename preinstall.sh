echo "Generating mysql config file..."
sed -i "s/{DATABASE}/${DATABASE}/" /etc/my.cnf.d/client.cnf
sed -i "s/{USER}/${USER}/" /etc/my.cnf.d/client.cnf
sed -i "s/{PASSWORD}/${PASSWORD}/" /etc/my.cnf.d/client.cnf
