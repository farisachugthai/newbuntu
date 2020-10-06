#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Rewrite ../NewParrot/06-dirs.sh as a python file.

It's gonna be a mess and might not even work correctly otherwise.

I ran the line alias mkdir=mkdir -pv in the bash file:

. pathlib docs `<https://docs.python.org/3/library/pathlib.html#pathlib.Path.mkdir>`

    To mimic behavior of mkdir -p, use parents=True and exists_ok=True

Simple enough
"""

from pathlib import Path
import os
import sys


def main():
    """ Still very much a rough draft.

    Going with hard coded paths and the directories I notice I immediately
    need so that I can utilize this quickly and then slowly build up a more
    generalized script that can handle differen OSes, file system, corner
    cases and levels of user interactivity.
    """

    home = os.path.expanduser("~")
    necessary_dirs = ['.bashrc.d', 'bin', '.config', '.config/nvim',
                      'projects', 'src', 'virtualenv', '.vim']

    for i in necessary_dirs:
        i = os.path.join(home, i)

        if Path.isdir(i) is False:
            Path.mkdir(i)

        # TODO: Alright all the directoreis are made. Run dlink.py
        # from the utilities repo and symlink all of your dotfiles in

    Path.mkdir(Path.join(home, '.ssh'))
    Path.


if __name__ == "__main__":
    main()
