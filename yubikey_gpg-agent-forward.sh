#!/bin/bash

function gpg-agent-forward() {
# BEGIN variables
# Input variables
ruser=$1
hostname=$2
# Generates random 3 character host shortcut. LC_CTYPE is needed for OS X and FreeBSD.
# https://gist.github.com/earthgecko/3089509
hostshortcut=$(cat /dev/urandom | env LC_CTYPE=C tr -dc "a-z0-9" | fold -w 3 | head -n 1)
# END VARIABLES

# BEGIN script
touch ~/.ssh/config
echo "CREATING GPG-AGENT FORWARDING CONFIG"
echo "YOUR HOST SHORTCUT IS \"$hostshortcut\""
echo "host $hostshortcut" >> ~/.ssh/config
echo "  hostname $hostname" >> ~/.ssh/config
echo "  User $ruser" >> ~/.ssh/config
echo "  RemoteForward /home/$ruser/.gnupg/S.gpg-agent $HOME/.gnupg/S.gpg-agent" >> ~/.ssh/config
echo "  RemoteForward /home/$ruser/.gnupg/S.gpg-agent.ssh $HOME/.gnupg/S.gpg-agent.ssh" >> ~/.ssh/config
echo "  ServerAliveInterval 10" >> ~/.ssh/config
echo "Use this shortcut to forward your Yubikey to $hostname:"
echo "  ssh $hostshortcut" 
echo "Inspect or edit the config:"
echo "  vi ~/.ssh/config"
echo "DONE"
return 0
# END script
}

gpg-agent-forward $1 $2
