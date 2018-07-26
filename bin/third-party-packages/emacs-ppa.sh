#!/bin/bash
# Honestly don't think this'll involve much outside of getting the PPA, i guess
# illl copy paste the directions and also show how to install spacemacs because
# that's actually the version of emacs i'm using.

> (base) faris@farisLinux:~$ sudo add-apt-repository ppa:ubuntu-elisp/ppa
> [sudo] password for faris:
> Sorry, try again.
> [sudo] password for faris:
>  The Official ;-) Ubuntu Emacs Daily Snapshot PPA.
>
> The packaging metadata used here was written completely from scratch in 2013 by Robert Bruce Park, completely discarding all legacy cruft associated with the official Emacs package for debian/ubuntu. This means:
>
> * No distropatches. Many of the existing distropatches were backported from trunk, so this shouldn't be a big deal, however there is a chance that your favorite bug was only ever fixed in a distropatch, and that has now regressed in these snapshots.
>
> * Little/no support for installing debian packages of elisp modules. Much of that support exists only in the form of a distropatch, which is not included here. So for example if you were to `apt-get install yaml-mode`, you would have to include "(require 'yaml-mode)" in your init, but you wouldn't be able to autoload yaml-mode like you may be accustomed to with the stable series. I am working on enabling this, but be warned that it is currently broken.
>
> * On the plus side, package.el works *excellently* and most of the packages you might want to install should be available either from MELPA or Marmalade or similar. In general, if you are using these snapshots you will want to `M-x package-install foo` rather than `apt-get install foo`.
>  More info: https://launchpad.net/~ubuntu-elisp/+archive/ubuntu/ppa
> Press [ENTER] to continue or ctrl-c to cancel adding it
>
> gpg: keyring `/tmp/tmpgo65lgko/secring.gpg' created
> gpg: keyring `/tmp/tmpgo65lgko/pubring.gpg' created
> gpg: requesting key D62FCE72 from hkp server keyserver.ubuntu.com
> gpg: /tmp/tmpgo65lgko/trustdb.gpg: trustdb created
> gpg: key D62FCE72: public key "Launchpad PPA for Ubuntu Emacs Lisp" imported
> gpg: Total number processed: 1
> gpg:               imported: 1  (RSA: 1)


#### """ 
Then i ran an update and couldn't find the right package. Apparently it provides
    both emacs 25 which is generally new [newer than the normal one i get] and
    emacs-snapshot which was updated a few hours ago. literally updated like
     every day. why not? 

So i went with emacs-snapshot but accidentally did it after already installing
emacs25. it messed each other up midinstallation so i got rid of everything then
reinstalled emacs-snapshot. 

opened it up and it launched spacemacs 25. cool!

"""
