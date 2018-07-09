#!/bin/bash
# Maintainer: Faris Chugthai

if ! [[ "$(command -v add-apt-repository)" ]]; then
    sudo apt-get update && sudo apt-get install -y add-apt-repository
fi

# TODO: Check if they have installed software-properties-common as that's a 
# dependency for adding PPAs

# Amazingly add-apt-repository autoruns apt-get update for us!
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get install neovim

if [[ -n "$CONDA_EXE" ]]; then
# wth bash is telling me conda: command not found....
# i'm getting nothing from `which conda` but command -v is finding it. sigh let's come up with a cheap workaround
    if [[ "$(command -v conda)" ]]; then
        conda deactivate;
        conda create -n neovim neovim python-language-server jedi flake8 autopep black npm
        conda activate neovim
    else
	    "$(echo "$CONDA_EXE")" install neovim;
	    "$(echo "$CONDA_EXE")" upgrade neovim;
    fi
else 
    if ! [[ "$(command -v pip3)" ]]; then
        sudo apt-get update && sudo apt-get install -y python3-pip
    fi
    pip3 install --user -U pip
    pip3 install --user -U neovim
fi

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# npm is a lot easier to work with in a conda environment so your best best
# is to create one
npm i -g neovim
npm install -g bash-language-server

nvim +PlugInstall +UpdateRemotePlugins +qall

# Add a Vim cheat sheet with
git clone https://github.com/lifepillar/vim-cheat40.git ~/.config/nvim/pack/bundle/start/cheat40

exit 0
