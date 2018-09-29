#!/bin/bash

if ! [[ "$(command -v npm)" ]]; then
    if [[ "$(command -v conda)" ]]; then
        conda install nodejs;
        npm i -g npm
        npm i -g neovim
        # npm i -g prettier
        npm i -g tldr
    else
        sudo apt-get install nodejs
        # TODO: Should make a function that installs the packages and gets called after we ensure we have a JS package manager 
        # Admittedly configuring things with node is more annoying when you don't have it in a conda environment
    fi
fi

exit 0
