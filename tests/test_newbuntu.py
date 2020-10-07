#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Test the newbuntu script I have."""
import pytest

try:
    import newbuntu
except ImportError:
    # Sloppy way of doing this but makes things easy if I didn't bother to install
    import os
    import sys
    sys.path.insert(0, os.path.abspath('..'))
    import newbuntu

if __name__ == "__main__":
    pytest.main()
