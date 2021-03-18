# How to Enable SSH on Ubuntu 18.04
Based on: [ https://linuxize.com/post/how-to-enable-ssh-on-ubuntu-18-04/ ]

Install SSH package
    sudo apt update
    sudo apt install openssh-server

Now, check if SSH is running

    sudo systemctl status ssh

Connecting to SSH Over Internet

    ssh username@public_ip_address -p port

Example

    ssh username@165.166.12.111 -p 22

Other commands

    sudo systemctl stop ssh
    sudo systemctl start ssh
    sudo systemctl disable ssh
    sudo systemctl enable ssh

TODO:
Setup SSH Passwordless Login
[ https://linuxize.com/post/how-to-setup-passwordless-ssh-login/ ]


