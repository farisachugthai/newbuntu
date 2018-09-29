#!/bin/bash
# Assumes Ubuntu due to the use of PPA's. 

# Honestly you can keep this around if you want but it's in the repos and available as a snap it's not necessary

if [ ! $(command -v add-apt-repository) ]; then
	sudo apt-get update && sudo apt-get install add-apt-repository
fi

sudo add-apt-repository ppa:dawidd0811/neofetch
sudo apt update 
sudo apt install neofetch

exit 0
