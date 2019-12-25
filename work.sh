echo "Starting Servis..."
cd /var/lib/bareos

/usr/sbin/bareos-dir -t -f && /usr/sbin/bareos-dir && echo 'bareos-dir started' &&\
/usr/sbin/bareos-sd && /usr/sbin/bareos-fd && /usr/sbin/httpd
sleep 2
echo 'Create user: '${ADMIN_USER}
bconsole << EOF
configure add console name=${ADMIN_USER} password=${ADMIN_PASS} profile=webui-admin tlsenable=false
EOF

while :
do
   sleep 1
done
echo "Exit"
