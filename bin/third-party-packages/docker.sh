#!/bin/bash

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


echo 'Let\''s download Docker\''s GPG keys.'

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo 'Verify the fingerprint is 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88'

sudo apt-key fingerprint 0EBFCD88
# So that should output the fingerprint so let's give people a minute to read

sleep 20


# Set up the docker repo
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# get docker installed and permissions set up correctly.
# requires root

sudo apt update && apt install docker docker.io
# might error and you might need to install docker.io

sudo groupadd docker

sudo usermod -aG docker "$USER"

echo "Now log out and log back in. Run 'docker run hello-world' to ensure that
docker has been installed correctly."

sudo apt-get install docker-ce
