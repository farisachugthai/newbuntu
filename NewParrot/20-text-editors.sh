#!/usr/bin/env bash
# Separate file because nvim now has so many dependencies

if ! [[ "$(command -v virtualenv)" ]]; then
    sudo apt-get update && sudo apt-get install python3-virtualenv
fi

if ! [[ -d "$HOME/virtualenv" ]]; then
    mkdir "$HOME/virtualenv" || exit 127
fi

cd "$HOME/virtualenv"

virtualenv -p python3 nvim
source nvim/bin/activate

pip install -U pip
pip install neovim flake8 python-language-server pylint

# Assumes proper dotfiles have been symlinked already
nvim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qall

# Assumes proper language support has been established
cd "$HOME/.local/share/nvim/plugged/LanguageClient-neovim/"

cargo build --release

exit 0
