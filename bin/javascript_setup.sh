#!/bin/bash
# Maintainer: Faris Chugthai

# First let's install node. Don't use JavaScript enough to prefer 
# npm or yarn. 
# Seems Kubuntu 18.04 comes with "^nodejs$" preinstalled but not npm.
# Oh and yarn isn't in the standard repos. Oh well.
sudo apt-get update && sudo apt-get install -y npm

# Update npm
sudo npm i -g npm

# Wow npm setup is such a pain
sudo chown -R "$USER:$(id -g)" "$HOME/.config/configstore"
chmod 755 "$HOME/.config/configstore"

# I did this just to have a spot to experiment
mkdir "$HOME/npm_experiments" && cd "$HOME/npm_experiments" || return
npm init;
# i wonder if bash is gonna keep running other commands while that's running lol

# Get some npm packages I like.
# TODO: I need to change what directory npm installs modules to because it's crazy annoying that
# I either have to sudo install node_modules or make /usr/local/lib world writable.
# could do something similar to what python does with ~/.local/{bin,local,share}
n="npm install -g"

$n neovim
# $n prettier
# $n proselint

unset n

# Alternatively you could run
# `conda install yarn`
# Don't know how I didn't realize that was a choice.

exit 0
