#!/usr/bin/env bash
# Last updated on: Jan 06, 2019

# Could be deleted and instead run only using conda.
# However if you want the non anaconda version of the script, here it is.

if [[ "$(lsb_release -rs)" == "18.04" ]]; then
   sudo snap install code
   exit 0
fi

if [[ -n "$(command -v gpg2)" ]]; then
    gpg=gpg2
elif [[ -n "$(command -v gpg)" ]]; then
    gpg=gpg
else
    sudo apt-get update && sudo apt-get install gpg2
    gpg=gpg2
fi

curl https://packages.microsoft.com/keys/microsoft.asc | "$gpg" --dearmor > microsoft.gpg

sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update

sudo apt-get install code
# sudo apt-get install code-insiders              # can be concurrently installed with vscode

exit 0
