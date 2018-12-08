#!/usr/bin/env bash
# Maintainer: Faris Chugthai

# set -euo pipefail

echo -e "We're going to add the Emacs PPA to the list of our trusted sources."

echo -e "As a result, please press enter at the prompt."

# Should we check for software-properties-common and all of that stuff
# or force this command to be chained in after other scripts that already
# made that check?
sudo add-apt-repository ppa:ubuntu-elisp/ppa

echo -e "You may now install emacs or emacs-snapshot. Snapshot is the nightly"
echo -e " build, but should prove to be relatively stable. However you may not"
echo -e " install both packages at the same time."

echo -e "Now we'll install spacemacs."

if [[ -f "$HOME/.emacs" ]]; then
    echo -e "Now we're going to back up your old emacs config to ~/.emacs.bak"
    mv -iv "$HOME/.emacs" "$HOME/.emacs.bak"
fi

if [[ -d "$HOME/.emacs.d" ]]; then
    echo -e "Backing up ~/.emacs.d to ~/.emacs.d.bak..."
    mv -iv "$HOME/.emacs.d" "$HOME/.emacs.d.bak"
fi

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo -e "If you have not done so already, run the script in this repository"
echo -e "to install NERD fonts. Source Code Pro as well as Mathematica are"
echo -e "available for Ubuntu 18.04+"

echo -e "Enjoy!"

exit 0
