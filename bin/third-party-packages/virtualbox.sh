#!/bin/bash
# Maintainer: Faris Chugthai

set -eu
#set -n          # comment out when comfortable. nerdcommenter --> <leader>cc

# TODO: So uh. What happens if that file does exist? like i don't wanna
# clobber it but we should still back their shit up.
if ! [[ -f /etc/apt/sources.list.bak ]]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
fi

# Download their gpg keys and add them.
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo " The key fingerprint for oracle_vbox_2016.asc is \\
B9F8 D658 297A F3EF C18D  5CDF A2F6 83C5 2980 AECF \\
Oracle Corporation (VirtualBox archive signing key) <info@virtualbox.org>\\
The key fingerprint for oracle_vbox.asc is: \\
7B0F AB3A 13B9 0743 5925  D9C9 5442 2A4B 98AB 5139 \\
Oracle Corporation (VirtualBox archive signing key) <info@virtualbox.org>\\ "

sleep 10;

# TODO: Need to do a whole lot of uname and/or lsb_releasing to fix the 'xenial' below
# TODO: What is this error message? Package downloads just fine.
# N: Skipping acquire of configured file 'contrib/binary-i386/Packages' as repository 'http://download.virtualbox.org/virtualbox/debian bionic InRelease' doesn't support architecture 'i386'

echo 'deb http://download.virtualbox.org/virtualbox/debian bionic contrib' |
sudo tee -a /etc/apt/sources.list

sudo apt-get update && sudo apt-get install virtualbox-qt dkms

exit 0
