#!/bin/bash
# Maintainer: Faris Chugthai
# Unfortunately this entire script has been rendered moot by snaps. Or i should say in 
# Ubuntu 18.04 only OSes

# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

# 2. Add the Spotify repository
sudo 'echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list'

# 3. Update list of available packages
sudo apt-get -qy update

# 4. Install Spotify
sudo apt-get -qy install spotify-client 

exit 0
