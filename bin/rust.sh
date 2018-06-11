#!/bin/bash
# Mainly for alacritty but we have to install the whole toolchain so

# I haven't tested that this is the way to automate the download but according to
# https://github.com/rust-lang-nursery/rustup.rs/blob/master/rustup-init.sh
# this script accepts a -y flag that disables confirmation prompts which sounds
# perfect to me.

if ! [[ -d ~/src ]]; then
    mkdir ~/src && cd ~/src
else
    cd ~/src || exit
fi

curl https://sh.rustup.rs -sSf | sh -y

git clone https://github.com/jwilm/alacritty.git
cd alacritty

rustup completions bash >> "$HOME/.bashrc.d/rustup-completion.bash"

rustup override set stable
rustup update stable

sudo apt-get update && sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip

# Be patient this part will take a while
cargo build --release;

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
cp alacritty-completions.bash ~/.bashrc.d/alacritty-completions.bash

mkdir -pv ~/.config/alacritty

cp alacritty.yml ~/.config/alacritty/alacritty.yml
