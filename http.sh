echo "Starting Servis..."

http
sleep 2
echo 'Create user: '${ADMIN_USER}
bconsole << EOF
configure add console name=${ADMIN_USER} password=${ADMIN_PASS} profile=webui-admin tlsenable=false
reload
EOF

while :
do
   sleep 1
done
echo "Exit"
