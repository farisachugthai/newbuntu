# Newbuntu

Post-installation scripts that configure vanilla Ubuntu into a fully featured development environment.

Installation scripts have been included to assist in setup.

## Dependencies:

The installation scripts are all written in Bash and Python3.
As a result, the following is necessary.

- Python3
- Git

Without these dependencies, the installation scripts are not guaranteed to work.
However, PPAs are provided to gain access to the most recently updated versions
of the software.

## Setup

To create a functional environment, run the scripts as follows.
There are manual steps involved in the case of restoring GPG and SSH keys from
offline sources; however, these are kept to the bare minimum.

**Step 0: Update, upgrade and restart new installation**

1. Git clone the repository.

```bash
git clone https://github.com/farisachugthai/newbuntu
```
