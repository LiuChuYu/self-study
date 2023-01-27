#!/bin/bash

# add user
USER="user"
if [ -n "${LOCAL_USER}" ]; then
    USER="${LOCAL_USER}"
fi

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting $USER with UID : $USER_ID"

useradd -m -u "$USER_ID" -s /bin/bash "$USER"
echo "$USER ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

# ssh key
cp -r /usr/winusr/.ssh ~/
chmod -R 700 /root/.ssh/
cp -r /usr/winusr/.ssh /home/user/
chown -R user:user /home/user
chmod -R 700 /home/user/.ssh/
chmod 760 /home/user/.ssh/known_hosts

exec /bin/bash
