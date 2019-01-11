#!/bin/bash
# so this file in and of itself is a perfect example of why we should refactor
# these scripts and make the minimal packages.sh, symlinking dotfiles and
# restoring SSH and GPG keys first.
# Then check your cpu and arch and download the right version of conda!
# Set a flag and if that's on then go through some simple steps.
# otherwise slog through everything.

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
