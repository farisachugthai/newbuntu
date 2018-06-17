#!/bin/bash
# Maintainer: Faris Chugthai

if ! [[ "$(command -v add-apt-repository)" ]]; then
    sudo apt-get update && sudo apt-get install -y add-apt-repository
fi

# Amazingly add-apt-repository autoruns apt-get update for us!
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get install neovim

if [[ -n "$CONDA_EXE" ]]; then
    if [[ "$(command -v conda)" ]]; then
        conda deactivate;
        conda create -n neovim neovim python-language-server jedi flake8 autopep black npm
        conda activate neovim
    else
	    "$(echo "$CONDA_EXE")" install neovim;
	    "$(echo "$CONDA_EXE")" upgrade neovim;

# Install system-wide
if [[ "$(command -v add-apt-repository)" ]]; then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get install neovim
else
    sudo apt-get update && sudo apt-get install add-apt-repository
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get install neovim
fi

# Install python plugin
if [ -n "$CONDA_EXE" ]; then
    if ! [[ "$(which conda)" ]]; then
        "$(echo "$CONDA_EXE")" install neovim;
	    "$(echo "$CONDA_EXE")" upgrade neovim;
    else
        conda install neovim;
        conda upgrade neovim;
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

nvim +PlugInstall +UpdateRemotePlugins +qall
# npm is a lot easier to work with in a conda environment so your best best
# is to create one
npm i -g neovim
npm install -g bash-language-server

# Add a Vim cheat sheet with
git clone https://github.com/lifepillar/vim-cheat40.git ~/.config/nvim/pack/bundle/start/cheat40

exit 0
