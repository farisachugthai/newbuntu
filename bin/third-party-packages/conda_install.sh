#!/usr/bin/env bash
# So wait why does this script not have the part where we curl/wget the actual conda script???
# Why would you assume conda's already installed?
# Or is this script just super old and not complete? *sigh*

set -eu
set -o pipefail


# If we can't activate the base environment shut everything down.
conda activate base || exit

conda config --add channels conda-canary;
conda config --add channels conda-forge;

if [[ -d "$HOME/projects/dotfiles/unix/" ]]; then
    ln -s "$HOME/projects/dotfiles/unix/.condarc" "$HOME/.condarc"
fi

# Try to keep as much as possible out of the base installation
# Everything you do should start in a separate environment unless installed by package manager
#conda create -n working_env --yes jupyter-lab notebook neovim flake8 yapf pandas scipy cheat yarn;

# Jupyter
conda create -n jupyter --yes notebook jupyter ipython

# Neovim
# Problem with creating a neovim environment is that you're gonna constantly
# get errors that certain modules aren't installed.
# Or you install every package from every project you ever work on in there.
conda create -n neovim --yes neovim python-language-server flake8 jedi pyls-mypy black yapf

conda deactivate

# Basically me taking notes on jupyter lab
# conda activate working_env
# yarn global add jupyterlab

# Experimental
# Jupyterlab
conda create -n jupyterlab jupyter-lab npm && npm i -g jupyter-lab && conda activate jupyterlab
# webpack --config webpack.prod.config.js # literally no idea what this does but yarn updated
# honestly haven't done anything with this yet
conda install -c condaforge jupyterthemes

conda install -c conda-forge jupyter_dashboards 

jupyter-dashboards quick-setup --sys-prefix --py        # otherwise tries to install to /usr/local/jupyter
jupyter nbextension enable jupyter_dashboards --py --sys-prefix # to have this activate everytime

# then i ran jupyter nbextension list and somehow i enabled jupyter-js-widgets....neat?

jupyter labextension install @jupyterlab/google-drive

jupyter-labextension enable @jupyterlab/google-drive # i think i did this but if you run
# `jupyter-labextension list` google drive comes up so whatever

# but this doesn't do anything because you can't activate the API anymore

exit 0
