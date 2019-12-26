echo 'Start sshd'

mkdir /root/.ssh
echo 'ssh-rsa '"${PUB_KEY}"' root@server.loc' > /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys

/usr/sbin/sshd -D
echo 'Stop'
