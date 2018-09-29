#!/bin/bash
# Maintainer: Faris Chugthai

# Setup Vim's package manager.
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install vundle and all relevant plugins.
# vim +PluginInstall +qall

# TODO: Wth is this? 
# Rename the file so that it's more obvious that it's an anaconda installation. Move the vim stuff out it's already in your nvimrc. If you want to link to it here go crazy.

# Why is both curl and wget in one script?

if [[ "$(command -v curl)" ]]; then
    downloadSRC="curl -fLo"
elif [[ "$(command -v wget)" ]]; then
    downloadSRC="wget -O"
else
    echo -e "You have neither curl nor wget on your system. Please download one."
fi

# Or setup vim plug
$downloadSRC ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && nvim +PlugInstall +qall

# Now let's put Miniconda on our workstation.
# From: 
# https://conda.io/docs/user-guide/install/macos.html#installing-in-silent-mode
# TODO: still missing those obvious chances at uname -anythingatall

echo -e "Now we'll begin downloading Miniconda3 for Linux. Assumes a 64 bit CPU.\n"
$downloadSRC "$HOME/miniconda.sh" https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash "$HOME/miniconda.sh" -b -p "$HOME/miniconda3";

#TODO: Run some kind of check that miniconda stays in their path. I have a conda init function in my bashrc.

export PATH="$HOME/miniconda/bin:$PATH"
source ~/miniconda3/etc/profile.d/conda.sh

if ! [[ "$(conda)" ]]; then
    echo -e "This wasn't installed correctly you gotta do something manually idk."
fi
# Now run all the updates
echo -e "Let's update conda.\n"
conda update conda 

echo -e "Create a base environment and update it. \n"
conda activate base
conda update -n base --all
conda install ipython
# conda install jupyter notebook
conda install flake8
conda install jedi
# conda install jupyter-lab

exit 0
