#!/usr/bin/env python
# -*- coding: utf-8 -*-
<<<<<<< HEAD
"""This package restores a hard-coded dotfiles repository.

Newbuntu:

It won't take much configuring to refactor so that the package takes CLAs.

However this repository is focused on configuring a development environment,
so fleshing out that script is unfortunately not the focus.
||||||| merged common ancestors

"""This package restores a hard-coded dotfiles repository.

Newbuntu:

It won't take much configuring to refactor so that the package takes CLAs.

However this repository is focused on configuring a development environment,
so fleshing out that script is unfortunately not the focus.
=======
"""Restore dotfiles and install necessary packages for an Ubuntu workstation.

This repository is still in the middle of refactoring.
For the time being, export only basic module information.
>>>>>>> Commit changes since switching back to KDE Neon
"""
from . import restore_dotfiles

from .__about__ import (
    __author__,
    __copyright__,
    __description__,
    __email__,
    __license__,
    __title__,
    __package_name__,
)
