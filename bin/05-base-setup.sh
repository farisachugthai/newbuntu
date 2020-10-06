#!/usr/env/bin bash
# Maintainer: Faris Chugthai

set -euo pipefail

# Objective: Get the minimum requirements for a functionally useful workstation.
# Install OpenSSH, a firewall, and update to the newest versions of Git and Vim we can find.

if [[ "$EUID" -ne 0 ]]; then
    echo "Please run as root"
    exit
fi

# Let's do a little base configuration
BASE_DIRECTORY="$(dirname $0)"

important() {
    echo -e "\033[31m${1}\033[0m"
}


# Update the system
apt update && apt upgrade -y && apt autoremove -y;

# Install OpenSSH
apt install -y openssh-server && apt install -y openssh-client;

# Setup a minimal firewall. {{{
if ! [[ "$(command -v gufw)" ]]; then
    apt install -y gufw;
    ufw enable
else
    ufw reload
fi

# Enable default deny and limit how often you get SSH requests
ufw default deny incoming && ufw limit OpenSSH

# Restart the firewall for changes to take effect
ufw reload

#}}}
# Before we start adding repositories, let's backup our old sources
cp -iv /etc/apt/sources.list /etc/apt/sources.list.bak

# Get the newest version of Git and corresponding documentation
# Adding repositories requires the user to hit 'Enter' to proceed which is
# An acceptable amount of user interaction
if ! [[ "$(command -v add-apt-repository)" ]]; then
    apt install software-properties-common add-apt-repository || echo "Can't add PPAs." && exit 1
fi

add-apt-repository ppa:git-core/ppa
apt update && apt install -y git git-man git-doc

# Also worth noting ppa:jonathonf/vim-daily
add-apt-repository ppa:jonathonf/vim
apt update && apt install -y vim-gtk3

exit 0
