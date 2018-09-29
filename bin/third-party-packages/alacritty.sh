#!/usr/bin/env bash
# Install the alacritty terminal

set -eu

# Try the easy way first but most people don't have rust already setup
if [[ command -v cargo ]]; then
    cargo install alacritty
    exit 0
fi

# TODO: Give them a choice to install rust using your other script
echo -e "It seems you don't have rust installed. Please do so; however we can install alacritty another way."

git clone https://github.com/jwilm/alacritty.git
cd alacritty

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
cp alacritty.yml ~/.config/alacritty/alacritty.yml

echo -e "Congrats you now have alacritty with autocompletions and manpages!"

exit 0
