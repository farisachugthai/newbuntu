#!/bin/bash 
# Assumes Ubuntu
# Maintainer: Faris Chugthai

# I suppose first things first we should check if they're running KDE Neon
# or Kubuntu or something.
# Then separate this out into default install and not.
a="sudo apt-get install -y"

$a dolphin-plugins
$a filelight                # legitimately disappointed this isn't in the default install
$a gnome-icon-theme         # use their icons so things look correct
$a kio-mtp
$a kio-stash                # git integration in dolphin AND viewable stashes
# $a kleopatra              # came a LONG way usability-wise over last 2 yrs
                            # also doesn't include the akonadi dependencies that kgpg has
# apparently the KDE neon version is newer and that makes all the difference
$a spectacle
$a qapt-utils
$a yakuake          # love the dropdown. move to kde specific.


# Included in Kubuntu 18.04
# $a ark              # for just an archive extractor, shockingly good
                    # has colorschemes, vim keybindings, preview splits
# $a dolphin
# $a kde-spectacle
# $a kdeconnect               # difficult to understate how great this is
# $a kio-gdrive
# $a konsole konsole-kpart
# $a okular


# Getting rid of unnecessary packages
sudo apt-get purge discover* && sudo apt-get autoremove       # I'm sorry 
sudo apt-get purge printer-driver-hpcups && sudo apt-get autoremove # Not sorry

sudo apt-get purge clamav && sudo apt-get autoremove            # ...wth?

# Muon is on the chopping block. Integrates well with the window manager since it's KDE
# but just a noticeably inferior product to Synaptic
# Doesn't resize appropriately, feels clunky and has a weird filing cabinet style layout on the left
