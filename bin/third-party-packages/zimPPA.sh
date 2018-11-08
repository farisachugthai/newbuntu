#!/usr/bin/env sh
# Maintainer: Faris Chugthai
# set -euo pipefail

# Tested on KDE Neon on 11/02/18

# TODO: When we port this to python keep in mind that we may want to give options for
# --no-install-recommends and --install-suggested for all of these
if [[ "$(command -v zim)" ]]; then
    echo -e "It looks like you already have Zim installed. We'll add the PPA \
    so you get more frequent updates!."
fi

if ! [[ "$(command -v apt-add-repository)" ]]; then
    echo -e 'In order for PPAs to work we'\''ll need to install `add-apt-repository`'
    sudo apt-get install apt-add-repository
else
    sudo apt-add-repository ppa:jaap.karssenberg/zim
fi

sudo apt-get install zim

exit 0
