#!/bin/bash 
# Assumes Ubuntu
# Maintainer: Faris Chugthai

# I suppose first things first we should check if they're running KDE Neon
# or Kubuntu or something.
# Then separate this out into default install and not.
a="sudo apt-get install -y"

$a dolphin-plugins
$a kio-gdrive
$a kio-mtp
$a kio-stash                # git integration in dolphin AND viewable stashes
$a kleopatra                # came a LONG way usability-wise over last 2 yrs
$a qapt-utils
$a yakuake          # love the dropdown. move to kde specific.

# Included in Kubuntu 18.04
$a ark              # for just an archive extractor, shockingly good
                    # has colorschemes, vim keybindings, preview splits
$a dolphin
$a kde-spectacle
$a kdeconnect               # difficult to understate how great this is
$a konsole konsole-kpart
