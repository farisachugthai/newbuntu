#!/bin/bash
# Maintainer: Faris Chugthai

conda activate base;
conda config --add channels conda-canary;
conda config --add channels conda-forge;

conda install --yes ipython flake8 cheat neovim;

conda create -n working_env --yes jupyter-lab notebook neovim flake8 yapf pandas scipy cheat yarn;

# Basically me taking notes on jupyter lab
conda activate working_env
yarn global add jupyterlab
# At what point do i just start running npm i -g npm in the conda script? because conda now controls python and JS

webpack --config webpack.prod.config.js # literally no idea what this does but yarn updated
# honestly haven't done anything with this yet
conda install -c condaforge jupyterthemes

conda install jupyter_dashboards -c conda-forge
jupyter-dashboards quick-setup --sys-prefix --py        # otherwise tries to install to /usr/local/jupyter
jupyter nbextension enable jupyter_dashboards --py --sys-prefix # to have this activate everytime

# then i ran jupyter nbextension list and somehow i enabled jupyter-js-widgets....neat?

jupyter labextension install @jupyterlab/google-drive

jupyter-labextension enable @jupyterlab/google-drive # i think i did this but if you run
# jupyter-labextension list google drive comes up so whatever


# honestly there's a lot of crazy stuff going on in 
# ~/miniconda3/envs/working_env/lib/python3.6/site-packages/

# CONDA HAS GIT. so we have python, ruby, javascript and git on top of neovim and the notebooks.

# can i call my OS the jupyter OS at this point?
exit 0
