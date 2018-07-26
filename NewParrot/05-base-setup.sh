#!usr/env/bin bash
# Maintainer: Faris Chugthai
#
# Objective: Get the minimum requirements for a functionally useful workstation. 
# Install OpenSSH, a firewall, and update to the newest versions of Git and Vim we can find.

# In this repository this script should be run first.
# In order to indicate as such, I decided on number the scripts in order.
# But honestly it just looks like a bad fonts.conf.d setup
# Either way.

if (( "$EUID" != 0 )); then
    echo "Please run as root"
    exit
fi

# Update the system
apt update && apt upgrade -y && apt autoremove -y;

# Install OpenSSH and UFW: {{{
apt install -y openssh-server;
apt install -y openssh-client;

# Setup a minimal firewall.
apt install -y gufw;

# In case it's already running restart it
ufw disable && ufw enable;

# Enable default deny
ufw default deny incoming;

# Limit how often you get SSH requests
ufw limit OpenSSH;

# Restart the firewall for changes to take effect
ufw disable;
ufw enable;
#}}}
# Before we start adding repositories, let's backup our old sources
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Get the newest version of Git and corresponding documentation
# Adding repositories requires the user to hit 'Enter' to proceed which is
# An acceptable amount of user interaction
if ! [[ "$(command -v add-apt-repository)" ]]; then
    apt install software-properties-common add-apt-repository
    add-apt-repository ppa:git-core/ppa
    apt update
    apt install -y git git-man git-doc

fi

# TODO: Gonna need to add in a backup plan if that doesn't work. Because some OSes don't have it.

# The default version of Vim in the repositories is currently 7.4 but we prefer
# Vim 8.1
add-apt-repository ppa:jonathonf/vim
apt update
apt install vim-gtk3

exit 0
