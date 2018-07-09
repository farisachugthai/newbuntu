#!/bin/bash

# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -


##### HOLY COW! As of writing this 06/15/18 Microsoft just added support for Ubuntu 18.04 YESTERDAY.
# How serendipitious
# https://github.com/PowerShell/PowerShell/releases/tag/v6.1.0-preview.3


# TODO: Check if we've already added them because of vscode
# TODO: Run uname or lsb_release on the version. Then in the else section recommend the app image.
# Register the Microsoft Ubuntu repository
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

# Install PowerShell
sudo apt-get update && sudo apt-get install -y powershell

exit 0
