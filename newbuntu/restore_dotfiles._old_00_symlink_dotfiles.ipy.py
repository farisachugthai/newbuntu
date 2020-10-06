#!/usr/bin/env ipython3
# -*- coding: utf-8 -*-
"""Symlink my hard-coded dotfiles into the home directory.

Depends:
    None

URL:
    https://github.com/farisachugthai

Params:
    Currently takes none. Git clones my specific dotfiles and puts them in
    a hard coded location. Behavior will change later.

Bugs:
    Currently non-functional.
    The iter_source_code function  isn't utilized.
    I believe the program is halting after realizing the directory it is
    cloning to isn't empty; however, it's failing silently.

"""
import os
import subprocess
import sys

# Should i make an __init__.py and just put these in all?
__author__ = 'Faris Chugthai'
__copyright__ = 'Copyright (C) 2018 Faris Chugthai'
__license__ = 'MIT'
__email__ = 'farischugthai@gmail.com'


def get_dotfiles():
    """Git clone my dotfiles and put them in a predetermined location."""
    try:
        os.chdir(proj)
    except NotADirectoryError:
        dir_checker(proj)

    # this is going to add many more steps to the process of finishing
    # this script; however the GitPython package looks really interesting
    # and could be useful for encapsulating git in python!
    try:
        clone = subprocess.run(
                ['git', 'clone', 'git@github.com:farisachugthai/dotfiles.git'],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE)
    except Exception as e:
        print(e)
        print(clone.stderr)
        print("The git clone command didn't work. See above: ")
        sys.exit("Exiting...")


def iter_source_code(tree):
    """Copied this from pyflakes so I really have to say thank you to PyCQA
    for both the wonderful tools but the great source code!

    :param dir: Where the dotfiles are located. Directories will be recursed
        into and any .py files found will be yielded.  Any non-directories will
        be yielded as-is.

    :return file
    """
    for item in tree:
        if os.path.isdir(item):
            for dirpath, dirnames, filenames in os.walk(tree):
                for filename in filenames:
                    full_path = os.path.join(dirpath, filename)
                    yield full_path
        else:
            yield item


def dir_checker(path):
    for root, dirs, files in os.walk(path):
        # Now lets do the folder check
        if not os.path.isdir(root):
            os.makedirs(root, exist_ok=False)


def symlink_repo(file):
    ''' Symlink the dotfiles if nothing exists in the home directory. '''

    src = os.path.join(repo, file)
    dest = os.path.join(home, file)
    try:
        os.symlink(src, dest)
    except FileExistsError:
        if os.path.islink(dest):
            # print("Sorry but a symlink to {0} already exists".format(dest))
            pass
        elif os.path.isfile(dest):
            print("Sorry but a file to {0} already exists".format(dest))


if __name__ == '__main__':
    # Module level vars but keep them isolated if we source anything from here
    home = os.path.join(os.path.expanduser("~"), "")
    proj = os.path.join(home, "projects")
    repo = os.path.join(proj, "dotfiles")
    get_dotfiles()
