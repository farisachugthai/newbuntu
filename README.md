# Newbuntu

Post-installation scripts that configure vanilla Ubuntu into a fully featured development environment.

Installation scripts have been included to assist in setup.

## Dependencies:

The installation scripts are all written in Bash and Python3.
As a result, the following is necessary.

- Python3
- Git
- Debian/Ubuntu/Termux derived OS.

Without these dependencies, the installation scripts are not guaranteed to work.
However, PPAs (for Ubuntu derived OSes) are provided to gain access to the most
recently updated versions of the software.

## Installation:

### Ubuntu:

To replicate the working environment, run the scripts as follows.

1. Git clone the repository.

```bash
git clone https://github.com/farisachugthai/newbuntu
```

2. Get essential packages such as git, ufw and OpenSSH.

- Run the [base setup](NewParrot/05-base-setup.sh) with `bash NewParrot/05-base-setup.sh`
  - This script installs software such as OpenSSH and configures ufw minimally.
  - Setup a very basic firewall with a default deny incoming policy and limited
  - allowances for OpenSSH. Install the newest version of Git, OpenSSH and GVim.

  - **Be aware that this script requires root permissions.**

{Comment: Do we need an absolute URL or can we use a relative file path?}
[05-base-setup.sh](https://github.com/farisachugthai/newbuntu/blob/master/NewParrot/05-base-setup.sh)


3. Restore config files and import private keys.

At this point it's going to be a good idea to manually configure your PKI
(or public key infrastructure) as necessary (I.E. importing keys, creating new
ones, revoking old keys.)
If you backed up GPG keys anywhere, restoring them is going to be important.

I, and many others I'm sure, have found the GPG command line syntax to be
quite cumbersome and confusing to navigate as there's over 200 options and regularly
similarly named features.

As a result, if you forget how to properly backup and then restore GPG keys,
you can check out this Gist I wrote with friendly reminders on how to do so.

4. Install necessary language support.

The Anaconda distribution allows one to install a huge number of packages
without the need for superuser privileges. This greatly eases the process of administring multiple workstations.
All packages are placed in the user's home directory, and conda provides support for python, ruby, JavaScript
{yarn and npm are available through conda}, rust, go and many many others.

Add language support with:

`bash NewParrot/10-language-support.sh`

5. Set up development environment.

20-text-editors

6. Add in additional packages via Snaps.

TODO: Provide a link to 10-language...sh


## TODO:

- Come up with some kind of front-end for the project. Currently the repo is a
  messy collection of useful albeit disorganized scripts.
    - Considering using prompt_toolkit to allow for both both simple prompts and
      autocompletion to enhance discoverability.


## Roadmap:

1. Create a minimal, functional working environment for Ubuntu.
   (Done)
2. Create a new user on an existing workstation that has all necessary packages installed. Run relevant scripts. Is the new user profile as useful as your usual daily driver? If not, then keep working.
3. Boot a new ISO, git clone the repo, run 1 script, and begin working as if it were your daily workstation.
