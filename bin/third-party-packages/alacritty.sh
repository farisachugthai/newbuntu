#!/usr/bin/env bash
# Install the alacritty terminal

set -eu

# Try the easy way first but most people don't have rust already setup
# Also I think the docs changed this. You can do cargo install cargo-deb
# And create a .deb which means handling it with your package manager
# and is a super easy way of handling things
if [[ "$(command -v cargo)" ]]; then
    cargo install alacritty
    exit 0
fi

# TODO: Give them a choice to install rust using your other script
# TODO: Prompt them otherwise? Don't make the statement below the first thing
# you say to someone.
echo -e "It seems you don't have rust installed. Please do so; however we can install alacritty another way."

# TODO: Give them  a choice of where this dir goes. Actually this isn't even 
# really a TODO, it's more like a must. They're more than likely in this repo
# dir if they're running the script and they don't want alacritty in here
git clone https://github.com/jwilm/alacritty.git
cd alacritty

# YOOO. This doesn't mean alacritty is installed!!!! You need to set up rust!
# The repo is called Newbuntu so we'll assume an Ubuntu OS but you actually
# haven't installed the package with this script.

# Once that's completed, a binary at /target/release/alacritty should have been made
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo desktop-file-install alacritty.desktop
sudo update-desktop-database

if ! [[ "$(command -v gzip)" ]]; then
    echo "How do you not have gzip.";
    sudo apt-get update && sudo apt-get install gzip
fi

# Make the man pages
sudo mkdir -p /usr/local/share/man/man1
gzip -c alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null


# Set up autocompletion
# TODO: check they have the dir
cp alacritty-completions.bash ~/.bashrc.d/alacritty-completions.bash

mkdir -pv ~/.config/alacritty

# TODO: Let them know where this file is.
cp -pv alacritty.yml ~/.config/alacritty/alacritty.yml

echo -e "Congrats you now have alacritty with autocompletions and manpages!"

exit 0
