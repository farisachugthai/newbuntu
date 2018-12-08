# TODO

11/01/18

So a lot of this involves my notes from the first day back.

## How do we organize this

Move everything from bin into NewParrot. NewParrot exists for shell scripts to be organized.

As frequently as possible, throw away those scripts and just do them in python and put them in newbuntu.

No pressure though.

Once NewParrot is done, we'll put everything back in bin. Well why not start there? Bin is so disorganized and low quality....actually so is NewParrot. I guess we can just move stuff over there and once we feel very comfortable with what we have, move it all back to bin.

Then newbuntu will have the newbuntu dir like specified in pylang.

### That's dandy but I mean organize in general

Yeah we need to consolidate where my notes are. Dropbox has a few, random scripts strewn in different repos do.

It's gonna be hard.

### Concerns

#### 41-fira-code.sh

Kinda pointless since firacode is in ubuntu 18.04 and tmk has been there before
this os. However it gave me a good idea. for things that are just git repos, do
them all in python and move it to ~/projects/newbuntu/newbuntu.
But if you require superuser priviledges then we'll just lean on the package
manager. Ideally as little as possible.

**Why is that a design goal for newbuntu?**
And yeah you should add design goals to the readme.
But why is executing random scripts from the internet as not the superuser an important goal? .....well security reasons are huge.
I won't elaborate past there.

#### 10-language-script.sh

In newparrot the 10-langauge script is awful. it works for android, parrrot and ubuntu??? No it doesn't it doesn't work fullly on any.

We're doing newbuntu so it's easy you dick!

## Git considerations

You know what's gonna suck?

Dude if you wanna have your commits for the other 2 branches counted, the way
that you have to do this merge is

1) Check out what's going on with master.
    - How many commits is it at?
    - What dirs exist, where are they and what state are they in?
2) Git checkout parrot or pypack. Whichever one is older.
    - Which means determining where those 2 branches are at
3) Merge the older branch
4) Merge the newer of the two
5) Merge the combined branch in
6) Create a new 'feature' branch and one that HAS to be much shorter lived
   than all of these were.
