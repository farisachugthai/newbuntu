#!/usr/bin/env bash
# Officially checked and works as of: Nov 03, 2018
set -euo pipefail

# FireFox Nightly is distributed in an Ubuntu PPA. I also consider if the
# user is on KDE Neon, a distro based off of Ubuntu, though I'm sure this
# could open a lot of possibilities.
if [[ "$(lsb_release -is)" == 'Ubuntu' || "$(lsb_release -is)" == 'neon' ]]; then
    sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
    sudo apt-get -q update
    sudo apt-get -qy install firefox-trunk
fi

exit 0
