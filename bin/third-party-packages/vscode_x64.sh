#!/bin/bash
# Maintainer: Faris Chugthai

# Could be deleted and instead run using conda.
# Awh anaconda-navigator just installs it with the package manager we may as well have done this
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code
sudo apt-get install code-insiders              # can be concurrently installed with vscode
