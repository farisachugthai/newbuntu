#!/usr/bin/env bash
# Last updated on: Nov 03, 2018

# Could be deleted and instead run only using conda.
# However if you want the non anaconda version of the script, here it is.

# Also if you want you could do this all with sudo snap install vscode.
# However that's only for Ubuntu 18.04 and whatever else gets snap packages.
if [[ "$(command -v gpg2)" ]]; then
    gpg=gpg2
elif [[ "$(command -v gpg)" ]]; then
    gpg=gpg
else
    sudo apt-get update && sudo apt-get install gpg2
    gpg=gpg2
fi

curl https://packages.microsoft.com/keys/microsoft.asc | "$gpg" --dearmor > microsoft.gpg

sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update

# TODO: Use select statement or something so that we can choose.
sudo apt-get install code
# sudo apt-get install code-insiders              # can be concurrently installed with vscode

exit 0
