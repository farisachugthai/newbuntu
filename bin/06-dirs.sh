#!/usr/bin/env bash

set -euo pipefail

alias mkdir="mkdir -pv"

# Unsure of why this is ever set differently; however, don't
# start making 777 stickybit dirs dude
umask 022 || exit

# Oh man reading this into an array, checking what already exists,
# reading that into another array and feeding that into xargs to piecemeal
# make all these dirs is gonna be a nightmare. let's run a python script from here

mkdir ~/.bashrc.d
mkdir ~/bin
mkdir ~/.config/nvim/after
mkdir ~/.config/nvim/ftplugin
mkdir ~/.config/nvim/spell
mkdir ~/google
mkdir ~/iso
mkdir ~/projects
mkdir ~/src
mkdir ~/.tmux
mkdir ~/virtualenvs
mkdir ~/.vim/after
mkdir ~/.vim/ftplugin
mkdir ~/.vim/spell
mkdir ~/.vim/undodir

# Now you can utilize the dlink.py file you have in the utilities repo and run commands to symlink everything in the repo back to your original dotfiles.
# I'm sure there's a for loop easily in there, or some implementation of os.walk but those things are difficult
# To cleanly write correct code for IMO

echo "If you haven't already, please access and restore your ssh configs and place them in the proper folders."
mkdir "$HOME/.ssh"

echo "Let's set your home directory as read-write-executable for only you and no permissions for other users. [700 in octal]"
chmod 700 "$HOME"
chmod 700 "$HOME/.ssh"

touch "$HOME/.ssh/config"
chmod 600 "$HOME/.ssh/config"


mkdir "$HOME/.gnupg"
chmod 700 "$HOME/.gnupg"


exit 0
