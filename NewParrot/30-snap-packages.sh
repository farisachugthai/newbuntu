#!/usr/bin/env bash
# Maintainer: Faris Chugthai

# Figured I'd name this 30 so that there's still room for packages in the realm of
# 'important to have but less important than 10-packages.sh

# So these are all snap packages. If you don't have the ability to use snaps
# IE permission issues or you literally don't have them, we gotta end the script.


if (( "$EUID" != 0 )); then
    echo -e "Please run as root. \n"
    exit
fi

if ! [[ "$(command -v 'snap info')" ]]; then
    echo -e "Snap info isn't working, and as a result, it' is assumed that
        \ snaps aren't properly configured on your system."
fi

## And now let's list the snaps I enjoy.

echo -e "Here are a few snaps that I genuinely enjoy and have had difficulty installing in other ways."
echo -e "Snaps are mounted as their own devices and as a result are constantly running in the background."
echo -e "For 2 or 3 snaps, this is fine, but I've had over 10 installed and
         \ it starts becoming a grind on your system."

echo -e "Shellcheck. A phenomenal bash linter that is written in Haskell,
        \ I'm unforunately in the position of not knowing how to install or
        \ build the package. But it doesn't matter!"

sudo snap install shellcheck --edge


echo -e "Spotify. They have their own PPA which receives updates sometimes but
        \ I'd trust it more as something that is mounted in a contained environment."

sudo snap install spotify


echo -e "Pycharm is a wonderful IDE in my opinion. Let's download it."

sudo snap install pycharm-community --edge --classic

echo -e "Don't forget to run sudo snap run [package-name] and then you're all set to go!"

exit 0
