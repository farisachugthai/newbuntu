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

## Installation

### Ubuntu:

To replicate the working environment, run the scripts as follows.

1. Git clone the repository.

```bash
git clone https://github.com/farisachugthai/newbuntu
```

TODO:  
/*  - (Optional) Run [minimal_ubuntu_install.sh](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/minimal_ubuntu_install.sh) to add repositories that receive more frequent updates for Vim and Git. 
  - In addition, this script installs software such as OpenSSH and configures ufw minimally.
  - Be aware that this script requires root permissions. From the root of the repository, it's therefore necessary to run

```bash
sudo bash "unix/bin/minimal_ubuntu_install.sh"
```

- (Optional) Run [full_ubuntu_install.sh](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/full_ubuntu_install.sh) for more software.
- Currently adds Spotify and VS Code to apt's sources.
- Neofetch is currently added as well as it is not in the Ubuntu 16.04 repositories.
- The full install is preprended by the minimal install script, so it's not necessary to run both.


2. Run [symlink_repo.py](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/symlink_repo.py) to create directories and symlinks in appropriate sections of the user's home directory.
3. (Optional) Run [user_ubuntu.sh](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/user_ubuntu.sh). This script does not require any special permissions and is intended to be run exclusively as a user with typical Unix permissions.

*/


## TODO:

 - Installation scripts will be coming soon that will allow for a turnkey solution for fresh operating systems that may not have desirable defaults.
 - Come up with some kind of front-end for the project. Currently the repo is a
   messy collection of useful albeit disorganized scripts.
    - Considering using prompt_toolkit to allow for both both simple prompts and
      autocompletion to enhance discoverability.


## Roadmap:

1. Create a minimal, functional working environment for Ubuntu.
   (Done)
2. Create a new user on an existing workstation that has all necessary packages installed. Run relevant scripts. Is the new user profile as useful as your usual daily driver? If not, then keep working.
3. Boot a new ISO, git clone the repo, run 1 script, and begin working as if it were your daily workstation.
