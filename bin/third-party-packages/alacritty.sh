#!/usr/bin/env bash
# Install the alacritty terminal

set -euo pipefail

# Try the easy way first but most people don't have rust already setup
# Also I think the docs changed this. You can do cargo install cargo-deb
# And create a .deb which means handling it with your package manager
# and is a super easy way of handling things
if [[ -n "$(command -v cargo)" ]]; then
    cargo install alacritty
    exit 0
else
    echo -e "You don't have rust installed. Please refer to [10-language-support.py](../../newbuntu/newbuntu/10-language-support.py)\n"
fi

# TODO: Give them a choice to install rust using your other script
echo -e "It seems you don't have rust installed. Please do so; however we can install alacritty another way.\n"


echo -e "Now we'll git clone the alacritty source code."

git clone https://github.com/jwilm/alacritty.git || exit 127
cd alacritty

# Now let's build
cargo build --release

# Once that's completed, a binary at /target/release/alacritty should have been made
if ! [[ -d target/release ]]; then 
    echo -e "Did building alacritty from source fail? Exiting because no target/release dir."
    exit
fi

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo desktop-file-install alacritty.desktop
sudo update-desktop-database

if [[ -z "$(command -v gzip)" ]]; then
    sudo apt-get update && sudo apt-get install gzip || exit
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
