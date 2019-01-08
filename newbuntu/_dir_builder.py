#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Create directories I always use. Not required for the project.

:Author: Faris Chugthai
:Email: farischugthai@gmail.com
:Github: https://github.com/farisachugthai

Usage
--------

To use the script run the following in a shell.::

    python 00

Python Docs
-------------

.. _mkdir: `<https://docs.python.org/3/library/pathlib.html#pathlib.Path.mkdir>`

    To mimic behavior of mkdir -p, use parents=True and exists_ok=True

Simple enough
"""
from pathlib import Path
import sys


def main():
    """
    Going with hard coded paths and the directories I notice I
    immediately need so that I can utilize this quickly and then
    slowly build up a more
    generalized script that can handle different levels of user
    interactivity.
    """
    necessary_dirs = ['.bashrc.d', 'bin', '.config/nvim',
                      'projects', '.ssh', 'src', 'virtualenvs', '.vim']

    for i in necessary_dirs:
        p = Path()
        i = Path.joinpath(p, Path.home(), i)

        if Path.is_dir(i) is False:
            Path.mkdir(i)

        # TODO: Alright all the directories have been made. Run dlink.py  {and
        # maybe drop a link for our viewers at home?
        # from the utilities repo and symlink all of your dotfiles in

    return 0


if __name__ == "__main__":
    sys.exit(main())
