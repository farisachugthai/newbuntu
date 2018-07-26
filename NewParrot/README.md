# README

Yeah so I'm kinda starting over again because this last version quite honestly sucks. 

So I installed Parrot OS on my laptop and now I'm kinda just tracking what I had
to do to get things to normal and how I generally prioritize things.

So let's also use some sort of index or TOC to keep order because I have no idea
whats going on in the other folder.

## URGENT TODOs:

Yeah kinda going kanban style where i'm prioritizing some todos over others.
Because this entire repo feels like a TODO at this point.

Fix the README because the links are all wrong it doesn't describe the repo
correctly at ALL etc etc

Also more clearly define the directory structure. you got 1 folder with all the
action but what's going on in there?

Maybe make one top level folder full of ppa scripts. One full of things you can
get out of the ubuntu/debian repos.

Some that are snaps idk dude honestly idgaf just make things clearly.

And then at some point in the future we're gonna need to refocus and think about
a front end because once these scripts become usable, nobody's gonna wanna slog
through them to figure out what to do.

So far the simple act of consolidating old scripts together and rerunning them
has given me a chance to look over them and make sure i didn't get excessively
lazy on shit lol. 


## TABLE OF CONTENTS

../bin/no-root.sh has all the conda stuff so honestly run it shortly after 
`sudo apt update && sudo apt upgrade -y && sudo apt autoremove`

But I suppose also fucking rename it because that's mad confusing!

Actually no the minimal packages script is the first thing to be run.

1. ../bin/minimal_packages.sh
Reason being that it installs a new version of git and conda after running
system updates. 
A) you have to be root to run apt upgrade. 
B) you don't have to be root to install conda.

so that script is dumb.

it configures the firewall and is just trying to do too many things.

let's clean this up substantially.

and please reorganize the repository thing into priority levels. 

like what things do i need and what things are nice to have around.


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
Also it's cool if you get Dropbox setup again, and then hardcode the symlinks
that you want pointing to dbox from your homedir. 

Either rewrite the linker that you used to have or just don't symlink 
fucking directories this is gonna be a nightmare to fix.

AND HOLY FUCK DO NOT USE DLINK.PY ON A DROPBOX FOLDER AGAIN IT APPEARS TO THE
FILE SYSYTEM TO NOT ONLY BE LOCAL BUT IT DOESN'T SHOW UP AS A FUCKING SYMLINK

the only way you can notice it is by using `realpath dir`

jesus fuck dude this is way too much.
Also come up with personal notes like

"Okay heres your exact order. 
Download the OS.
Run updates.
Create GPG keys.
Then open firefox and log into Google etc etc"

A lot of it is still scriptable like setting up your dropbox again.

Just try to keep thoughts and stuff in here because just spewing out scripts
like last time isn't gonna work.
