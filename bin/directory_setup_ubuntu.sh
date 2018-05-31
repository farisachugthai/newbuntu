#!/bin/bash

# This doesn't need to be it's own script it'll just get merged into another one when i figure
# out a good logical spot for it
# Basically this entire script is a TODO

# On that list i'd like to add, we have dlink.py now. Do we write a script for each folder? Then do the same for root? Or other users?

alias mkdir="mkdir -pv"

mkdir ~/.bashrc.d
mkdir ~/bin
mkdir ~/.tmux
mkdir ~/projects
mkdir ~/virtualenvs
mkdir ~/.vim/after
mkdir ~/.vim/ftplugin
mkdir ~/.vim/spell
mkdir ~/.vim/undodir
mkdir ~/.config/nvim/after
mkdir ~/.config/nvim/ftplugin
mkdir ~/.config/nvim/spell
mkdir ~/.config/nvim/undodir

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
