#!/bin/bash
# Download the Signal Desktop app

# Official docs if you have deb based linux. Ubuntu 16.04 and deb 8 [or maybe 9 idk]
if [[ "$(lsb_release -rs)" == "16.04" ]]; then
    wget --quiet --output-document - https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add - ;
    echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list ;
    sudo apt-get install -qy apt-transport-https && sudo apt-get update && sudo apt-get install -qy signal-desktop;
fi

# But if you have ubuntu 18.04 you can just go:
if [[ "$(lsb_release -rs)" == "18.04" ]]; then
   sudo snap install signal-desktop 
fi
