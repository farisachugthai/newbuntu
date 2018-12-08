# README

## Suggestions and Roadmap:

11/01/18

What'll end up taking a ton of work [outside of just resetting up this operating system while learning how to do so using python], is getting code organized and where it needs to be.

Good spot to start?

Pick away at 10-langauge-support.sh.

Its the amalgation of lots of different things, and as you keep working on this repo, you'll probably end up dropping the unimportant bs.

Also don't hesitate to do the same thing or even just copy paste the vim-setup.py file in viconf over.

Old: 
Yeah so I'm kinda starting over again because this last version quite honestly sucks.

So I installed Parrot OS on my laptop and now I'm kinda just tracking what I had
to do to get things to normal and how I generally prioritize things.

So let's also use some sort of index or TOC to keep order because I have no idea
whats going on in the other folder.

## TODO:

### Urgent

Yeah kinda going kanban style where I'm prioritizing some tasks over others.
Because this entire repo feels like a TODO at this point.

Fix the README because the links are all wrong it doesn't describe the repo
correctly at ALL etc etc

Also more clearly define the directory structure. you got 1 folder with all the
action but what's going on in there?

### Less urgent

Maybe make one top level folder full of PPA scripts. One full of things you can
get out of the Ubuntu/Debian repos.

Some that are snaps idk dude honestly idgaf just make things clearly.

And then at some point in the future we're ooing to need to refocus and think about
a front end because once these scripts become usable, nobody's ooing to wanna slog
through them to figure out what to do.

## TABLE OF CONTENTS

*not really a TOC more like the progression of steps*

**Step 0: Update, upgrade and restart new installation**

### Now what is it that we need to get done?

#### Step 1: Get vital packages. IE Git, OpenSSH, ufw...

../bin/no-root.sh has all the conda stuff so honestly run it shortly after
`sudo apt update && sudo apt upgrade -y && sudo apt autoremove`

But I suppose also fucking rename it because that's mad confusing!

Actually no the minimal packages script is the first thing to be run.

[package list](../bin/minimal_packages.sh)
Reason being that it installs a new version of git and conda after running
system updates.
A) you have to be root to run apt upgrade.
B) you don't have to be root to install conda.

so that script is dumb.

it configures the firewall and is just trying to do too many things.

let's clean this up substantially.

and please reorganize the repository thing into priority levels.

like what things do i need and what things are nice to have around.

#### Step 2: Clone dotfiles and symlink the appropriate ones.

Take note of how folders like
[youtube-dl](https://github.com/farisachugthai/dotfiles/tree/termux/unix/.config/mpd) have different configs for termux or Ubuntu.

Any symlinker script you write will have to take acct of that.

#### Step 3: Language specific downloads.

Id rather let the language specific package manager handle things on OSes that
aren't rolling releases.

#### Step 4: Create or restore GPG / SSH keys

#### Step 5: Sign into online accts

Going to be hard to script that

#### Step 6: Setup dropbox / gdrive

Then also create your usual symlinks in $HOME pointing to frequent places


### Current repo

- 00-base-setup.sh
> So this is setting up git vim, openssh and ufw at a very simple level.

- 10-language-setup.sh
> Because so much is constantly being thrown around it's confusing to have in a
> ton of places. Let's compile ALL [yes all] the python, ruby, perl, javascript,
> rust etc etc etc stuff into one file. it'll hopefully make things a little bit
> simpler especially because i plan on deferring as much as possible to conda.

In the future it may be easier to break it all up, but for now let's leave
things in one spot.

Also coming up with a really hacky 'mkdir' type file is gonna be okay.
Up until you get something more set in stone in terms of home directory setup, a
cheap hack is gonna be better than a complex thing that doesn't work when things
change. Like don't overengineer it homie.
