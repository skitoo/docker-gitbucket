#!/bin/bash

if [ ! -d /home/user ]; then
    #let's create a user to ssh into
    SSH_USERPASS=`pwgen -c -n -1 8`
    mkdir /home/user
    useradd -G sudo -d /home/user user
    chown user /home/user
    echo user:$SSH_USERPASS | chpasswd
    echo ssh user password: $SSH_USERPASS
    echo %sudo        ALL=NOPASSWD: ALL >> /etc/sudoers
fi

# start supervisor
supervisord -n
