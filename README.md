# Newbuntu

Post-installation scripts that configure vanilla Ubuntu into a fully featured
development environment.

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

TODO: One script that calls everything.


2. Get essential packages such as git, ufw and OpenSSH.

Setup a very basic firewall with a default deny incoming policy and limited
allowances for OpenSSH. Install the newest version of Git, OpenSSH and GVim.

Be aware that this script requires root permissions. From the root of the
repository, it's therefore necessary to run

` sudo bash "bin/initial.sh`

3. Restore config files and import private keys.

At this point it's going to be a good idea to personally configure SSH as
necessary. If you backed up GPG keys anywhere, restoring them is going to be important.

I, and many others I'm sure, have found the gpg command line syntax to be
quite cumbersome and confusing to navigate as there's over 200 options and regularly
similarly named features.

As a result, if you forget how to properly backup and then restore GPG keys,
you can check out a short gist here: TODO:

4. Install necessary language support.

The Anaconda distribution allows one to install a huge number of packages
without the need for superuser privileges. All packages are placed in the
user's home directory, and conda provides support for python, ruby, javascript
{yarn and npm are available through conda}, rust, go and many many others.

TODO: Provide a link to 10-language...sh

5. Set up development environment.

20-text-editors

6. Add in additional packages via Snaps.

7. Back up /etc/apt/sources.list and add PPAs.

8. Add in packages the conventional way through apt.

9. Log into online accounts.

This is gonna be really hard to script. Enough of my accounts require 2-FA that
I think this has to be an inherently long and manual process.
