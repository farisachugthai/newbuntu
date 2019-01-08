# Newbuntu

Post-installation scripts that configure vanilla Ubuntu into a fully
featured development environment.

Installation scripts have been included to assist in setup.

## Dependencies:

The installation scripts are all written in Bash and Python3.
As a result, the following is necessary.

- Python3
- An Ubuntu based operating system.
  - Certain scripts require the presence of software that won't be available on
  other operating systems.
  - The emphasis is on Ubuntu **based**.
  All of these scripts work on Android OS as a result of the app
  Termux, which I highly recommend.

Without these dependencies, the installation scripts are not guaranteed to work.

<<<<<<< HEAD
<<<<<<< HEAD
## Setup
||||||| merged common ancestors
## Installation
=======
## Installation:
>>>>>>> Making a branch to consolidate all changes.
||||||| merged common ancestors
## Installation:
=======
The scripts that require PPAs can be omitted; however, no guarantees
can be made unless all steps are followed.
>>>>>>> Closer to merging master in

<<<<<<< HEAD
To create a functional environment, run the scripts as follows.
There are manual steps involved in the case of restoring GPG and SSH keys from
offline sources; however, these are kept to the bare minimum.
||||||| merged common ancestors
### Ubuntu:
=======
## Installation:
>>>>>>> Closer to merging master in

<<<<<<< HEAD
**Step 0: Update, upgrade and restart new installation**
||||||| merged common ancestors
To replicate the working environment, run the scripts as follows.
=======
As all of the scripts are laid out in the repository, installation is as simple
as cloning the repository. Users may find it easier if they clone to a dir
that's already available on their $PATH. Ubuntu typically sets up the ~/bin
dir for this purpose among others.
>>>>>>> Closer to merging master in

### Git clone the repository.

```bash
git clone https://github.com/farisachugthai/newbuntu
```

<<<<<<< HEAD
<<<<<<< HEAD
TODO: One script that calls everything.
||||||| merged common ancestors
TODO:  
/*  - (Optional) Run [minimal_ubuntu_install.sh](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/minimal_ubuntu_install.sh) to add repositories that receive more frequent updates for Vim and Git. 
  - In addition, this script installs software such as OpenSSH and configures ufw minimally.
  - Be aware that this script requires root permissions. From the root of the repository, it's therefore necessary to run
=======
2. Get essential packages such as git, ufw and OpenSSH.
>>>>>>> Making a branch to consolidate all changes.
||||||| merged common ancestors
2. Get essential packages such as git, ufw and OpenSSH.
=======
Simple as that!

## Usage

Let's get into what this repository accomplishes.

1. Get essential packages such as git, ufw and OpenSSH.
2. Restoring config files and private keys.
3. Installing support for desirable programming languages.
4. Setting up sensible and useful features for a development environment.
5. Add in additional packages via Snaps.

### Essential Packages
>>>>>>> Closer to merging master in

<<<<<<< HEAD
||||||| merged common ancestors
```bash
sudo bash "unix/bin/minimal_ubuntu_install.sh"
```
=======
- Run the [base setup](NewParrot/05-base-setup.sh) with `bash NewParrot/05-base-setup.sh`
  - This script installs software such as OpenSSH and configures ufw minimally.
  - Setup a basic firewall with a default deny incoming policy and limited
  allowances for OpenSSH. Install the newest version of Git, OpenSSH and GVim.

  - **Be aware that this script requires root permissions.**

### Config Files / PKI

At this point it's a good idea to manually configure your PKI
(or public key infrastructure) as necessary (I.E. importing keys, creating new
ones, revoking old keys.)

If you backed up GPG keys anywhere, restoring them is going to be important.

I, and many others I'm sure, have found the GPG command line syntax to be
quite cumbersome and confusing to navigate as there's over 200 options and
regularly similarly named features.

As a result, if you forget how to properly backup and then restore GPG keys,
you can check out this Gist I wrote with friendly reminders on how to do so.

### Language Support

The Anaconda distribution allows one to install a huge number of packages
without the need for superuser privileges. This greatly eases the process of administring multiple workstations.

All packages are placed in the user's home directory, and conda provides support for python, ruby, JavaScript
{yarn and npm are available through conda}, rust, go and many many others.

Add language support with:

`bash NewParrot/10-language-support.sh`
>>>>>>> Making a branch to consolidate all changes.

<<<<<<< HEAD
<<<<<<< HEAD
2. Get essential packages such as git, ufw and OpenSSH.
||||||| merged common ancestors
- (Optional) Run [full_ubuntu_install.sh](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/full_ubuntu_install.sh) for more software.
- Currently adds Spotify and VS Code to apt's sources.
- Neofetch is currently added as well as it is not in the Ubuntu 16.04 repositories.
- The full install is preprended by the minimal install script, so it's not necessary to run both.
=======
5. Set up development environment.
>>>>>>> Making a branch to consolidate all changes.
||||||| merged common ancestors
5. Set up development environment.
=======
### Development Environment
>>>>>>> Closer to merging master in

<<<<<<< HEAD
<<<<<<< HEAD
Setup a very basic firewall with a default deny incoming policy and limited
allowances for OpenSSH. Install the newest version of Git, OpenSSH and GVim.
||||||| merged common ancestors
=======
20-text-editors
>>>>>>> Making a branch to consolidate all changes.

<<<<<<< HEAD
Be aware that this script requires root permissions. From the root of the repository, it's therefore necessary to run
||||||| merged common ancestors
2. Run [symlink_repo.py](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/symlink_repo.py) to create directories and symlinks in appropriate sections of the user's home directory.
3. (Optional) Run [user_ubuntu.sh](https://github.com/farisachugthai/dotfiles/blob/master/unix/bin/user_ubuntu.sh). This script does not require any special permissions and is intended to be run exclusively as a user with typical Unix permissions.
=======
6. Add in additional packages via Snaps.
>>>>>>> Making a branch to consolidate all changes.
||||||| merged common ancestors
20-text-editors

6. Add in additional packages via Snaps.
=======
[Set up your text editors](NewParrot/20-text-editors)

### Additional Packages
>>>>>>> Closer to merging master in

<<<<<<< HEAD
` sudo bash "bin/initial.sh`
||||||| merged common ancestors
*/
=======
TODO: Provide a link to 10-language...sh
>>>>>>> Making a branch to consolidate all changes.

<<<<<<< HEAD
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
||||||| merged common ancestors

## TODO:
=======
## Roadmap
>>>>>>> Closer to merging master in

TODO: Provide a link to 10-language...sh

5. Set up development environment.

<<<<<<< HEAD
20-text-editors

6. Add in additional packages via Snaps.

7. Back up /etc/apt/sources.list and add PPAs.

8. Add in packages the conventional way through apt.

9. Log into online accounts.

This is gonna be really hard to script. Enough of my accounts require 2-FA that
I think this has to be an inherently long and manual process.


## TODO:
||||||| merged common ancestors
 - Installation scripts will be coming soon that will allow for a turnkey solution for fresh operating systems that may not have desirable defaults.
 - Come up with some kind of front-end for the project. Currently the repo is a
   messy collection of useful albeit disorganized scripts.
    - Considering using prompt_toolkit to allow for both both simple prompts and
      autocompletion to enhance discoverability.
=======
- Come up with some kind of front-end for the project. Currently the repo is a
  messy collection of useful albeit disorganized scripts.
    - Considering using prompt_toolkit to allow for both both simple prompts and
      autocompletion to enhance discoverability.
>>>>>>> Making a branch to consolidate all changes.

<<<<<<< HEAD
Yeah I mean a lot of things.

### User interface
||||||| merged common ancestors

## Roadmap:
=======
## Checklist:
>>>>>>> Closer to merging master in

<<<<<<< HEAD
It's literally just scripts how do we interact with the user?
||||||| merged common ancestors
1. Create a minimal, functional working environment for Ubuntu.
   (Done)
2. Create a new user on an existing workstation that has all necessary packages installed. Run relevant scripts. Is the new user profile as useful as your usual daily driver? If not, then keep working.
3. Boot a new ISO, git clone the repo, run 1 script, and begin working as if it were your daily workstation.
=======
1. Create a minimal, functional working environment for Ubuntu.
   (Done)
2. Create a new user on an existing workstation that has all necessary
packages installed. Run relevant scripts. Is the new user profile as
useful as your usual daily driver? If not, then keep working.
3. Boot a new ISO, git clone the repo, run 1 script, and begin
working as if it were your daily workstation.
>>>>>>> Closer to merging master in
