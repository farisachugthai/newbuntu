#!/usr/bin/env bash
# So wait why does this script not have the part where we curl/wget the actual conda script???
# Why would you assume conda's already installed?
# Or is this script just super old and not complete? *sigh*

set -eu
set -o pipefail

conda_install(){
    curl --config ./curlrc --output miniconda.sh "https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-$(uname -m).sh"
    bash miniconda.sh -b
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
}

if ! [[ -d "$HOME/miniconda3" ]]; then
    conda_install
fi

# If we can't activate the base environment shut everything down.
conda activate base || echo -e "Couldn't activate conda. Ensure everything in 
installation finished properly. If so, close terminal and re-run script." && exit 127

conda config --add channels conda-canary;
conda config --add channels conda-forge;

# Linking my personal dotfiles back.
if [[ -d "$HOME/projects/dotfiles/unix/" ]]; then
    ln -s "$HOME/projects/dotfiles/unix/.condarc" "$HOME/.condarc"
fi

echo -e "Try to keep as much as possible out of the base installation as you can."

echo -e "Install as much as possible in separate environments, and you'll have \
a very smooth experience."

#conda create -n working_env --yes jupyter-lab notebook neovim flake8 yapf pandas scipy cheat yarn;

# Jupyter
# conda create -n jupyter --yes notebook jupyter ipython

# Neovim
# Problem with creating a neovim environment is that you're gonna constantly
# get errors that certain modules aren't installed.
# Or you install every package from every project you ever work on in there.
# conda create -n neovim --yes neovim python-language-server flake8 jedi yapf ipython restructuredtext_lint

# conda deactivate
exit 0
