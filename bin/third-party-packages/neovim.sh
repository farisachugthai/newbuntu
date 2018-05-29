#!/bin/bash
# Maintainer: Faris Chugthai

# Also note that this package is installed in the conda installation. Which only covers conda packages.
# So we're gonna need to make a python package installation file. Hm.
# TODO: Check if they have add-apt-repository it's not a default package
sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get update				# does add-apt-repository autorun update? apparently it does.
sudo apt-get install neovim

# This is probably a good way to check if Conda is installed
# Debating whether to use this one because it ensures that they've activated conda
# if [ "$CONDA_SHLVL" -gt 0 ]; then 
# or this one because it means we have the executable
if [ -n "$CONDA_EXE" ]; then
# wth bash is telling me conda: command not found....
# i'm getting nothing from `which conda` but command -v is finding it. sigh let's come up with a cheap workaround
    if [ "$(command -v conda)" ]; then
        conda install neovim;
        conda upgrade neovim;
    else
	    "$(echo "$CONDA_EXE")" install neovim;
	    "$(echo "$CONDA_EXE")" upgrade neovim;
    fi
else 
    if [ "$(command -v pip3)" ]; then
        pip3 install --user -U neovim
    fi
fi

# Oh my god it finally worked.
# TODO: Install vim-plug. I swear that's in one of these scripts.
# I have no idea where it went so copy-paste from the GitHub.
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# As a result of our vim markdown plugin, this script officially needs to run
# After we modify where npm puts things
nvim +PlugInstall +qall

# Add a Vim cheat sheet with
git clone https://github.com/lifepillar/vim-cheat40.git ~/.config/nvim/pack/bundle/start/cheat40

exit 0
