#!/bin/bash
# yeah this should get deleted and refactored with the stuff in 10-languages-support.

# I genuinely don't know ruby just wanted to throw this out
# Probably set up in the weirdest way but it gets the software you want!

# Update your system's built-in ruby
if [[ $EUID == 0 ]]; then
    sudo gem update
else
    gem update --user
fi

# Install rvm [which is, surprisingly and unsurprisingly not packaged with
# Anaconda]
echo -e 'As of 06/30/2018 the fingerprint on the gpg keys held by the developers of RVM is \n409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB\n'
echo 'Ensure that this is correct.'
sleep 10

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

# It also exists as a PPA
# https://github.com/rvm/ubuntu_rvm
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm

echo 'Restarting your computer.'
sleep 5
echo 'When the computer turns back on, run `rvm install ruby-head`'

sudo shutdown -r now
