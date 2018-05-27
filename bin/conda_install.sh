#!/bin/bash
# Maintainer: Faris Chugthai

conda activate base;
conda config --add channels conda-canary;
conda config --add channels conda-forge;

conda install --yes ipython flake8 cheat neovim;

conda create -n working_env --yes jupyter notebook neovim flake8 yapf pandas scipy cheat;

exit 0
