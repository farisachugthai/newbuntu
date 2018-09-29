#!/bin/bash
# Download powershell
# Assumes 64bit CPU and was originally written when that was the only arch Microsoft supported for Linux OSes

if [[ "$(lsb_release -rs)" == "16.04" ]]; then
# Import the public repository GPG keys
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - ;
    curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list ;

# Install PowerShell
    sudo apt-get update && sudo apt-get install -y powershell
fi

if [[ "$(lsb_release -rs)" == "18.04" ]]; then
   sudo snap install powershell --classic           # gives you powershell 6 on linux!
fi

exit 0
