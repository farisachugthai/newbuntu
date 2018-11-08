#!/usr/bin/env ipython3
# -*- coding: utf-8 -*-
"""Symlink my hard-coded dotfiles into the home directory.

This script is used for restoring dotfiles by creating directories and symlinking
them to a different file tree.

Ideally, the script will be generalized.

TODO:
    Ran this and got these errs::
        (base) faris@faris-U56E:~/projects/newbuntu/newbuntu$ python restore_dotfiles.py 
        fatal: destination path 'dotfiles' already exists and is not an empty directory.
        Traceback (most recent call last):
          File "restore_dotfiles.py", line 152, in <module>
            main()
          File "restore_dotfiles.py", line 139, in main
            tree_check()
          File "restore_dotfiles.py", line 99, in tree_check
            src_dir = ( direc for direc in os.listdir(REPO) not in HOME )
        TypeError: 'in <string>' requires string as left operand, not list
"""
import os
import sys


def get_dotfiles(PROJ):
    """Git clone dotfiles and put them in a predefined directory.

    TODO:
        - Import argparse and allow the user to specify.
        - Subprocess and capture output. Ensure command ran successfully.

    :param path: The path to the dotfiles

    """

    try:
        os.chdir(PROJ)
    except NotADirectoryError as e:
        os.makedirs(PROJ) and os.chdir(PROJ) or sys.exit(
                "Couldn't create the necessary directory. Error: " + e)

    try:
        os.system("git clone git@github.com:farisachugthai/dotfiles.git")
    except Exception as e:
        print(e)
        print("The git clone command didn't work. See above: ")


def iterSourceCode(tree):
    """Copied this from pyflakes so I really have to say thank you to PyCQA
    for both the wonderful tools but the great source code!

    :param dir: Where the dotfiles are located. Directories will be recursed
        into and any .py files found will be yielded.  Any non-directories will
        be yielded as-is.

    :return file: The file to be symlinked's absolute path
    """
    for item in tree:
        if os.path.isdir(item):
            # low key we should check that the directory is a directory in $HOME first
            for dirpath, dirnames, filenames in os.walk(tree):
                for filename in filenames:
                    dest_path = os.path.join(dirpath, filename)
                    yield dest_path
        else:
            dest_abs_path = os.path.abspath(item)
            yield dest_abs_path


def tree_check():
    """Use a comprehension to validate directory existence in $HOME.
    
    The directories in the tree where the files currently are, require a
    mirrored setup in the user's home directory.ensure all the directories in
    the repository are existent and writable.
    """
    all_dirs = [ direc for direc in os.listdir(REPO) if os.path.isdir(direc) ]

    # this syntax HAS to be wrong. also does listdir return only directories or every file?
    src_dir = ( direc for direc in os.listdir(REPO) not in HOME )
    os.makedirs(src_dir)


# def dir_checker():
    # for root, dirs, files in os.walk(REPO):
        # # Now lets do the folder check
        # if not os.path.isdir(root):
            # os.makedirs(root, exist_ok=False)


def symlink_repo(file):
    """Symlink the dotfiles if nothing exists in the home directory.
    
    :param file: File to be symlinked
    """

    src = os.path.join(REPO, file)
    dest = os.path.join(HOME, file)
    try:
        os.symlink(src, dest)
    except FileExistsError:
        if os.path.islink(dest):
            # print("Sorry but a symlink to {0} already exists".format(dest))
            pass
        elif os.path.isfile(dest):
            pass
        # thinking about making an exception for .bashrc, .profile etc.
        # otherwise these if loops wouldn't be here
        # not sure if I wanna try a regex or just hard code it in


def main():
    """Symlink a repository pointing from relevant config directories in $HOME.

    After checking the necessary directories are present in "$HOME", we begin symlinking.

    We could just symlink all the files but to make things more efficient
    and generally more interesting we're gonna use a generator to iterate
    over all the files in the repo
    """
    get_dotfiles()

    tree_check()
    # in REPO and ensures that they exist in $HOME
    # like i don't trust that dir_checker nonsense

    for file in iterSourceCode(REPO):
        symlink_repo(file)


if __name__ == '__main__':
    # Module level vars but keep them isolated if we source anything from here
    HOME = os.path.join(os.path.expanduser("~"), "")
    PROJ = os.path.join(HOME, "projects")
    REPO = os.path.join(PROJ, "dotfiles")
    main()
