#!/usr/bin/env bash
# Install kitty onto a Linux OS and incorporate desktop integration

# Temporarily comment out while I rerun this
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin 

# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
if ! [[ -d "$HOME/.local/bin" ]]; then
    mkdir -pv "$HOME/.local/bin"
fi

ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/

# Place the kitty.desktop file somewhere it can be found by the OS
if ! [[ -d ~/.local/share/applications ]]; then
    mkdir -pv ~/.local/share/applications
fi

cp -iv ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/

# Update the path to the kitty icon in the kitty.desktop file
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
