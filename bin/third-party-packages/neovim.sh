#!/bin/bash
# Maintainer: Faris Chugthai

# This is tricky with neovim requiring a system wide installation AND user 
# installation for python/JS plugins
# Should make a conda env just for neovim


# TODO: Flip this loop around. 
# Would we have to evaluate an exit code if ! [[command -v a-a-r]] ?

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
# wth bash is telling me conda: command not found....
# i'm getting nothing from `which conda` but command -v is finding it. sigh let's come up with a cheap workaround
    if ! [[ "$(which conda)" ]]; then
        "$(echo "$CONDA_EXE")" install neovim;
	    "$(echo "$CONDA_EXE")" upgrade neovim;
    else
        conda install neovim;
        conda upgrade neovim;
    fi
else 
    if [ "$(command -v pip3)" ]; then
        pip3 install --user -U neovim
    fi
fi


# Now install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +UpdateRemotePlugins +qall

# Add a Vim cheat sheet with
git clone https://github.com/lifepillar/vim-cheat40.git ~/.config/nvim/pack/bundle/start/cheat40

exit 0
