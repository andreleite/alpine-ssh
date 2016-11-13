#!/bin/bash

adduser -D ${USER} && echo "${USER}:${PASSWORD}" | chpasswd
mkdir /home/${USER}/.ssh
chmod 0700 /home/${USER}/.ssh
echo ${PUBLIC_KEY} >> /home/${USER}/.ssh/authorized_keys
chmod 0600 /home/${USER}/.ssh/authorized_keys
touch /home/${USER}/.bash_profile
chown -R ${USER}:${USER} /home/${USER}

sed -i 's/andreleite:x:1000:1000:Linux User,,,:\/home\/andreleite:/andreleite:x:1000:1000:Linux User,,,:\/home\/andreleite:\/bin\/bash/g' /etc/passwd
echo "${USER} ALL=(ALL) ALL" >> /etc/sudoers

rm /etc/motd

ssh-keygen -A

/usr/sbin/sshd -D
