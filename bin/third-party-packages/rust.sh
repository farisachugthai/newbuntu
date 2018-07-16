#!/usr/bin/env bash
# Rust Setup for both Android and Ubuntu

set -eu

if [[ "$(uname -o)" == 'Android' ]]; then
    # add the necessary repo
    pkg update && pkg upgrade -y && pkg install cargo rustc
else
    sudo apt-get update && sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip
fi

if ! [[ -d ~/src ]]; then
    mkdir ~/src && cd ~/src
else
    cd ~/src || exit
fi

curl https://sh.rustup.rs -sSf | sh -y

rustup completions bash >> "$HOME/.bashrc.d/rustup-completion.bash"

rustup override set stable
rustup update stable

# Be patient this part will take a while
cargo build --release;

echo -e "You now have rust! Go forth and enjoy ripgrep, faster terminals and stable toolchains!"

exit 0
