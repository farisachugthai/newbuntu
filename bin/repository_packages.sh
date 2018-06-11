#!/bin/bash 
# Assumes Ubuntu
# Maintainer: Faris Chugthai

sudo apt-get update || exit

# TODO: There need to be a way to call the package name after this command and add || exit && print("[package name] is not available") or something
a="sudo apt-get install -y"

# Security and Administration. OpenSSH and gufw are installed by minimal.
$a aircrack-ng
$a apt-transport-https
$a apt-transport-tor
$a autossh
$a avahi-discover               # with Avahi Browser. very simple zeroconf tool
$a bleachbit
$a gnupg
$a gnupg2
$a keepassxc		            # Need to check that we're using 18.04
$a lm-sensors                   # Nobody likes melted CPUs!
$a mat
$a software-properties-common   # Should've been called already but in case
$a tcpdump
$a traceroute
$a vagrant                      # still need to learn
$a wireshark
$a whois
$a xdotool
$a zenmap


# Help on the command-line. Vim and Git are installed from minimal.
$a bash-completion
$a ffmpeg
$a htop			                # Interestingly now a snap
$a ncdu
$a ntfs-3g
$a rclone                   # In the repos in 18.04 just gotta check os version 
# $a qemu                       # be prepared for a metapackage when you run
$a tree
$a virt-manager
$a xclip
$a xsel


# Utilities
$a dnsutils
$a findutils
$a hfsplus
$a hfsprogs
$a hfsutils
$a id-utils
$a poppler-utils
$a sensible-utils
# $a xz-utils


# Docs
$a freebsd-manpages
# $a info
$a manpages
$a manpages-posix
$a manpages-posix-dev
$a pandoc
$a python3-examples
$a python3.6-examples
$a python3.7-examples               # yes it's officially here
$a texinfo


# Terminal specific
$a dvtm
$a i3wm
$a pymux
$a rxvt-unicode-256color
# $a termit         # not the termite shell in the repos
$a tmux


# For development. Python and JavaScript have their own files.
$a adb
$a clang
$a easygit         # its difficult software guys
$a exuberant-ctags
$a fastboot
$a gdb
$a git-hub              # go get i think
$a make

# Internet. Add firefox nightly below.
$a chromium-browser
$a chromium-browser-l10n
$a chromium-chromedriver
$a chromium-codecs-ffmpeg-extra
$a chromium-ublock-orign                # well that's nice
$a curl
$a ddgr                                 # DuckDuckGo has an app in the repos console only :D
$a deluge
$a network-manager
$a sockstat                             # gotta thank the BSD boys
$a torbrowser-launcher
$a w3m

# Packages that aren't necessary at all but fun and/or convenient.
$a audacity
$a cherrytree
$a cmatrix
$a cowsay
$a fortune
$a gimp
$a mpd
$a ncmpcpp
$a octicons
$a onionshare
$a sl 
$a screenfetch
$a vlc
$a weechat
$a zim                                  # PPA and in repo

# Fonts. Can't think of something less pressing.
f="$a fonts"
"$f-fantasque-sans"
"$f-firacode"
"$f-font-awesome"
"$f-hack-ttf"
"$f-mathjax"
"$f-mathjax-extras"
"$f-noto"
fonts-humor-sans

# Packages to get rid of. Things in default Kubuntu 18.04 that aren't necessary and annoying
sudo apt-get purge print-manager && sudo apt-get autoremove


# Fix bash's proclivity for global variables
unset a f

# TODO: 
# So I wanted to create my own function for asking the user 
# If they want a certain package and fork the script to the appropriate file.
# gotta love vim. :119,137s/^/#/gc
# commented it out until i have the rest of the script tested and down pat
#function opt-pkg()
#{
#    local instl=`bash "ubuntu-packages/$0"`
#    echo "Now we'll be installing $0"
#}
#
#
## Add Spotify
#opt-pkg "spotify.sh"
#
#
## Neofetch for Ubuntu 16.10 >
## Neofetch 17.04 < has Neofetch in the repos
#opt-pkg "neofetch.sh"
#
## Group all the stuff that requires a specific CPU arch together
#if [[ `uname -m == x86_64` ]]; then
#    opt-pkg "vs-code.sh"
#fi

# add docker, atom, ffnightly, virtualbox, gitter, dropbox, powershell, skypeforlinux, tails-installer

# Now snap's
sudo snap refresh
# TODO: This is wrong. What is the syntax for if != True
if ! [ "$(command -v shellcheck)" ]; then
    sudo snap install --channel=edge shellcheck
fi
sudo snap install signal-desktop
sudo snap install pycharm-community --channel=edge --classic

sudo snap install gitter
####### !!!!! #######
sudo snap install google-cloud-sdk --classic
# Was definitely embarassed at how excited i was to see this one



# TODO: How to properly do function calls in Bash.
if ask "Would you like to install optional KDE-specific software?" N; then
    bash "ubuntu-packages/kde-specific.sh"
fi

if ask "Would you like to install optional GNOME-specific software?" N; then
    echo "Coming shortly! Sorry."
fi

exit 0
