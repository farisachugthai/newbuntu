#!/usr/bin/env ipython3
# -*- coding: utf-8 -*-
"""Symlink my hard-coded dotfiles into the home directory.

:URL: https://github.com/farisachugthai

Params:
    Currently takes none. Git clones my specific dotfiles and puts them in
    a hard coded location. Behavior will change later.

"""
import os
import subprocess
import sys
from pathlib import Path


def get_dotfiles(proj):
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


def tree_check(REPO):
    """Use a comprehension to validate directory existence in $HOME.

    The directories in the tree where the files currently are, require a
    mirrored setup in the user's home directory.ensure all the directories in
    the repository are existent and writable.
    """
    if hasattr(REPO, '__fspath__'):
        REPO = REPO.__fspath__()

    src_dir = [direc for direc in os.listdir(REPO) if os.path.isdir(direc)]
    for i in src_dir:
        try:
            os.makedirs(i)
        except FileExistsError:
            pass


def dir_checker(path):
    for root, dirs, files in os.walk(path):
        # Now lets do the folder check
        if not os.path.isdir(root):
            os.makedirs(root, exist_ok=False)


def _dir_builder():
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


def symlink_repo(repo, file):
    """Symlink the dotfiles if nothing exists in the home directory.

    :param file: File to be symlinked
    """
    home = Path.home().__fspath__()
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


def main():
    """Symlink a repository pointing from relevant config directories in $HOME.

    After checking the necessary directories are present in "$HOME", we begin symlinking.

    We could just symlink all the files but to make things more efficient
    and generally more interesting we're gonna use a generator to iterate
    over all the files in the repo
    """
    home = Path.home()
    PROJ = os.path.join(home, "projects")
    get_dotfiles(PROJ)

    REPO = os.path.join(PROJ, "dotfiles")
    tree_check(REPO)
    # in REPO and ensures that they exist in $HOME
    # like i don't trust that dir_checker nonsense

    for file in iter_source_code(REPO):
        symlink_repo(REPO, file)


if __name__ == '__main__':
    # Module level vars but keep them isolated if we source anything from here
    main()
