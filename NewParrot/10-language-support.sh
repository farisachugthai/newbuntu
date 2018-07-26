#!/usr/bin/env bash
# Maintainer: Faris Chugthai

# So up until things get a bit more organized let's dump all of our language related ideas into one spot hm?

# Rust Setup for both Android and Ubuntu
# The proper repositories need to be added for this script
# to run on an Android platform.
# However they're around here....somewhere.

set -eu

if [[ "$(uname -o)" == 'Android' ]]; then
    # add the necessary repo
    pkg update && pkg upgrade -y && pkg install cargo rustc
else
    # if memory serves rustup didn't work on an aarch64 cpu
    sudo apt-get update && sudo apt-get install cmake libfreetype6-dev libfontconfig1-dev xclip
    curl https://sh.rustup.rs -sSf | sh -y
    rustup completions bash >> "$HOME/.bashrc.d/rustup-completion.bash"
    rustup override set stable
    rustup update stable

fi

if ! [[ -d ~/src ]]; then
    mkdir ~/src && cd ~/src
else
    cd ~/src || exit
fi


# Be patient this part will take a while
cargo build --release;

echo -e "You now have rust! Go forth and enjoy ripgrep, faster terminals and stable toolchains!"

## TODO: Conda install. It's around here somewhere....
wget -O "$HOME/miniconda.sh" "http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-`uname -m`.sh"

# JavaScript: 
## This is also gonna be a conda controlled thing because it's very easy for things to get wildly out of control

conda create -n yarn yarn
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
echo -e 'As of 06/30/2018 the fingerprint on the gpg keys held by the developers of RVM is \n409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB\n'
echo 'Ensure that this is correct.' 
sleep 10

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

# TODO: Indent this section of code and run `lsb_release==Ubuntu` or something.
# which obviously it should be even right now it'd be convenient to run this script and i can't
# It also exists as a PPA
# https://github.com/rvm/ubuntu_rvm
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm

# Alright after rvm is installed
# Ensure all the dependencies for ruby2 are installed.

rvm install ruby-head

exit 0
