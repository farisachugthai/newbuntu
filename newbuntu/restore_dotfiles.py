#!/usr/bin/env ipython3
# -*- coding: utf-8 -*-
"""
Symlink my hard-coded dotfiles into the home directory.

Depends:

https://github.com/farisachugthai

All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

"""



import os
import sys

# So this is gonna link a lot of pointless files you don't care about
# and with files like .manpath.termux and .mpd.conf.termux you actually don't
# want it linked at all

def get_dotfiles():
    """Git clone my dotfiles and put them in the exact directory I expect."""

    try:
        os.chdir(PROJ)
    except NotADirectoryError as e:
        os.makedirs(PROJ) and os.chdir(PROJ) or sys.exit("Couldn't create the necessary directory.")

    # admittedly this is going to add many more steps to the process of finishing
    # this script; however the GitPython package looks really interesting
    # and could be useful for encapsulating git in python!
    try:
        os.system("git clone git@github.com:farisachugthai/dotfiles.git")
    except Exception as e:
        print(e)
        print("The git clone command didn't work. See above: ")


    # DON"T GIT ADD THIS FILE YET
    # But like how do we call a generator function in A) the correct way and
    # B) the most conventional and pythonic way?

    # iterSourceCode(REPO)
    # that function call will return a file in the dotfile repo.
    # so let's use that as the dest argument when calling symlink_repo
    # so
    # dest = iterSourceCode(REPO)
    # symlink_repo(dest, src)
    # now that iterSourceCode call needs to be wrapped in a for loop to
    # actually iterate through the whole tree. how do we write that correctly?
def iterSourceCode(dir):
    """
    Copied this from pyflakes so I really have to say thank you to PyCQA
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

def dir_checker():
    for root, dirs, files in os.walk(repo):
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
            backup_prompt()

def main():
    # TODO:
    get_dotfiles()

if __name__ == '__main__':
    # Module level vars but keep them isolated if we source anything from here
    HOME = os.path.join(os.path.expanduser("~"), "")
    PROJ = os.path.join(home, "projects")
    REPO = os.path.join(proj, "dotfiles")
    main()
