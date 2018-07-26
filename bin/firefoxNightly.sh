#!/usr/bin/env bash
# Written by the lovely people at Mozilla.
# I've simply written something small so one doesn't have to remember to install it.

# firefox nightly in ubuntu PPA. tested using lsb_release.
# KDE Neon has PPAs and doesn't go by 'Ubuntu' so this might need to be a a case ... esac loop
if [[ "$(lsb_release -is)" == 'Ubuntu' ]]; then
    sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
    sudo apt update
    sudo apt install firefox-trunk
elif [[ "$(lsb_release -is)" == 'Parrot' ]]; then
    echo -e "First off we're gonna need to do something about firejail because all your applications are currently sandboxed.\n"
fi

exit 0
