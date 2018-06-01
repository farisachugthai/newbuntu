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
$a byobu
$a dvtm
$a i3wm
$a rxvt-unicode-256color
$a termit
$a tmux


# For development. Python and JavaScript have their own files.
$a adb
$a clang
$a easygit         # its difficult software guys
$a exuberant-ctags
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
# $a neofetch                           # PPA but script already provided.
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
if [ "$(command -v shellcheck)" ]; then
    sudo snap install --channel=edge shellcheck
fi
# Need to figure out how to use the ask() function.
# sudo snap install signal-desktop
# sudo snap install pycharm-community --channel=edge --classic

# rclone is horrifically annoying as a snap. due to the sandboxing
# it doesn't allow itself to write a config file and that's too much
# sudo snap install rclone 			# is an option. idk if it's better to get as a snap or not

# Look what else we found
# sudo snap install htop
# sudo snap install tldr --edge

# doesn't recognize the function defined below.
# TODO: How to properly do function calls in Bash.
if ask "Would you like to install optional KDE-specific software?" N; then
    bash "ubuntu-packages/kde-specific.sh"
fi

if ask "Would you like to install optional GNOME-specific software?" N; then
    echo "Coming shortly! Sorry."
fi


# modified version of ask.sh
# from: https://gist.github.com/davejamesmiller/1965569#file-ask-sh
# So thank you Dave!

# This is a general-purpose function to ask Yes/No questions in Bash, either
# with or without a default answer. It keeps repeating the question until it
# gets a valid answer.

ask() {
    # https://djm.me/ask
    local prompt default reply

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # can we just put
        ques="Would you like to install "
        # and now for prompt all i have to write is
        # ask "$ques + "packagename (y/n)" Y; then
        # 1. how does string concatenation work in bash.
        # 2. what data types does it use?
        # 3. prompt needs to be tue 1st argument. do we end up woth 2 if
        # we do it this way?

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read reply </dev/tty

        # Default?
        if [ -z "$reply" ]; then
            reply=$default
        fi

        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}


# thanks vim.
# :159,194s/^/#/gc
# EXAMPLE USAGE:
#
#if ask "Do you want to do such-and-such?"; then
#    echo "Yes"
#else
#    echo "No"
#fi
#
## Default to Yes if the user presses enter without giving an answer:
#if ask "Do you want to do such-and-such?" Y; then
#    echo "Yes"
#else
#    echo "No"
#fi
#
## Default to No if the user presses enter without giving an answer:
#if ask "Do you want to do such-and-such?" N; then
##    echo "Yes"
#else
#    echo "No"
#fi
#
## Only do something if you say Yes
#if ask "Do you want to do such-and-such?"; then
#    said_yes
#fi
#
## Only do something if you say No
#if ! ask "Do you want to do such-and-such?"; then
#    said_no
#fi
#
## Or if you prefer the shorter version:
#ask "Do you want to do such-and-such?" && said_yes
#
#ask "Do you want to do such-and-such?" || said_no
exit 0
