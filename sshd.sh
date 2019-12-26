echo 'Start sshd'

mkdir /root/.ssh
echo 'ssh-rsa '"${PUB_KEY}"' root@server.loc' > /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
sed -i 's/.*GatewayPorts.*/GatewayPorts yes/' /etc/ssh/sshd_config
/usr/sbin/sshd -D
echo 'Stop'
