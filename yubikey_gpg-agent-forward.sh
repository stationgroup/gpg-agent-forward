#!/bin/bash

function gpg-agent-forward() {
ruser=$1
hostshortcut=$(cat /dev/urandom | env LC_CTYPE=C tr -dc "a-z0-9" | fold -w 3 | head -n 1)
hostname=$2
touch ~/.ssh/config
echo "CREATING GPG-AGENT FORWARDING CONFIG"
echo "YOUR HOST SHORTCUT IS \"$hostshortcut\""
echo "host $hostshortcut" >> ~/.ssh/config
echo "  hostname $hostname" >> ~/.ssh/config
echo "  User $ruser" >> ~/.ssh/config
echo "  RemoteForward /home/$ruser/.gnupg/S.gpg-agent $HOME/.gnupg/S.gpg-agent" >> ~/.ssh/config
echo "  RemoteForward /home/$ruser/.gnupg/S.gpg-agent.ssh $HOME/.gnupg/S.gpg-agent.ssh" >> ~/.ssh/config
echo "  ServerAliveInterval 10" >> ~/.ssh/config
echo "Use this shortcut to forward your Yubikey to $host:"
echo "  ssh $hostshortcut" 
return 0
}

gpg-agent-forward $1 $2
