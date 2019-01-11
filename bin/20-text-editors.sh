#!/usr/bin/env bash
# Separate file because nvim now has so many dependencies

# TODO: When designing the user interface, prompt for which environment manager they want to use.
if ! [[ "$(command -v virtualenv)" ]]; then
    sudo apt-get update && sudo apt-get install python3-virtualenv
fi

# Give the choice for what directory AND give them a chance to change it later.
# As a result, the default if they specify nothing should be that env manager's default.
if ! [[ -d "$HOME/virtualenv" ]]; then
    mkdir "$HOME/virtualenv" || exit 127
fi

# TODO: Save their current dir and then go back at the end.
cd "$HOME/virtualenv"

virtualenv -p python3 nvim
source nvim/bin/activate

pip install -U pip
pip install neovim flake8 python-language-server pylint

# Assumes proper dotfiles have been symlinked already
nvim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qall

# Lots of different ways to do this; however, building from source creates a
# 900mb build instead of a 200mb bin.
# Assumes proper language support has been established
# cd "$HOME/.local/share/nvim/plugged/LanguageClient-neovim/"

# cargo build --release

# unrelated but since we created a deb for a few things, can we set up a repo
# and serve it on termux?
exit 0
