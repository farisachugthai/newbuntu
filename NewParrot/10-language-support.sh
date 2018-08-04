#!/usr/bin/env bash
# Maintainer: Faris Chugthai

# So up until things get a bit more organized let's dump all of our language related ideas into one spot hm?

set -eu
set -o pipefail

# Determine hardware
# I don't know what took me so long to think of this

if [[ "$(command -v lsb_release)" ]]; then
    OS="$(lsb_release --short --id)"       # Typically outputs the single word Ubuntu, Parrot, Termux etc
else
    OS="$(uname -o)"
fi

# Rust Setup for both Android and Ubuntu
# The proper repositories need to be added for this script
# to run on an Android platform.
# However they're around here....somewhere

if [[ "$OS" == 'Android' ]]; then
    # TODO: add the necessary repo
    pkg update && pkg upgrade -y && pkg install cargo rustc

else
    # IMPORTANT: don't install rust with conda. rustup will complain if there's
    # an existing rust installation and i'd prefer using rustup then using
    # conda for everything
    # unrelated note: if memory serves rustup didn't work on an aarch64 cpu
    sudo apt-get update && sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip

    # don't know how to automate this exactly. requires the user to agree to the default settings.
    curl https://sh.rustup.rs -sSf | sh
    rustup completions bash >> "$HOME/.bashrc.d/rustup-completion.bash"
    rustup override set stable
    rustup update stable

fi

# i mean i'm sure i did it for a reason but i genuinely can't tell you what
# the purpose of this part was. to programatically allow the user to have a directory to write their code in? idk.
# if ! [[ -d ~/src ]]; then
#     mkdir ~/src && cd ~/src
# else
#     cd ~/src || exit
# fi

echo -e "You now have rust! Go forth and enjoy ripgrep, faster terminals and stable toolchains!"
echo -e "We're going to run source $HOME/.cargo/env so that we can keep running in the same shell."

source "$HOME/.cargo/env"

echo -e "Now we can install ripgrep and fd!"

cargo install ripgrep fd-find

echo -e "The Rust Language Server comes pre-installed after running updates.
    \ But if we want code-completion from racer we need to setup the nightly channel."

rustup install nightly
rustup run nightly cargo install racer

# Conda

wget -O "$HOME/miniconda.sh" "http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-`uname -m`.sh"

# TODO: Verify this is the right command
bash -b -p "$HOME/miniconda3" "$HOME/miniconda.sh"

if [[ -d "$HOME/miniconda3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

conda update -n base --all || echo "Conda may not have been acivated. Reopen
    \ your shell and if running the command 'conda' with no options returns
    \ an error, then source '$HOME/miniconda3/etc/profile.d/conda.sh'"
    \ && exit 127

conda activate base || exit 127

conda install cheat

# JavaScript:

## This is also gonna be a conda controlled thing because it's very easy for things to get wildly out of control

conda create -n yarn
conda activate yarn
conda install yarn
yarn global add bash-language-server tldr
conda deactivate

# Ruby: 
# I genuinely don't know ruby just wanted to throw this out there
# Let's start by installing rvm
# Alternatively we could use conda and install different versions of ruby that way

# Update your system's built-in ruby
if [[ $EUID == 0 ]]; then
    sudo gem update
else
    gem update --user
fi

# Install rvm [which is, surprisingly and unsurprisingly not packaged with
# Anaconda] 

if [[ "$OS" == 'Ubuntu' ]]; then
    # https://github.com/rvm/ubuntu_rvm
    sudo apt-get install software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt-get install rvm
else
    echo -e 'As of 06/30/2018 the fingerprint on the gpg keys held by the developers of RVM is \n409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB\n'
    echo 'Ensure that this is correct.' 
    sleep 10

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
fi
# Alright after rvm is installed
# Ensure all the dependencies for ruby2 are installed.

# rvm crashes if it knows it's not on the PATH. export it before the installation.
export PATH="$PATH:$HOME/.rvm/bin"
rvm install ruby-head

exit 0
