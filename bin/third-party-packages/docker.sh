#!/usr/bin/env bash

# Set up docker on a user's computer and get permissions set up correctly.
# Requires root

if [[ "$(lsb_release -rs)" == "18.04" ]]; then
   sudo snap install docker
   exit 0
fi

# Unfortunately gotta go the longer way.
echo "Let's download Docker's GPG keys."

if [[ -z "$(command -v curl)" ]]; then
    sudo apt-get update && sudo apt-get install curl
fi

curl -sSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo 'Verify the fingerprint is 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88'

sudo apt-key fingerprint 0EBFCD88
# That should output the fingerprint so let's give people a minute to read

sleep 20

# Set up the docker repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update && sudo apt-get install docker docker.io
# might error and you might need to install docker.io

sudo groupadd docker

sudo -H usermod -aG docker "$USER"

echo "Now log out and log back in. Run 'docker run hello-world' to ensure that
docker has been installed correctly."

sudo apt-get install docker-ce

exit 0
