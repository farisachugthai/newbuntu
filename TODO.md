# TODO

Dec 14, 2018

We should add some files that explain how to properly export SSH and GPG keys
and then instruct the user on how to import them. If this proves to be a long
explanation, then either make a few Gists about it or throw it in the wiki.

## Concerns

### 41-fira-code.sh

Kinda pointless since firacode is in ubuntu 18.04 and tmk has been there before
this os. However it gave me a good idea for things that are just git repos, do
them all in python and move it to [newbuntu](~/projects/newbuntu/newbuntu).
But if you require superuser priviledges then we'll just lean on the package
manager. Ideally as little as possible.

**Why is that a design goal for newbuntu?**

Yeah you should add design goals to the readme.
But why is executing random scripts from the internet as not the
superuser an important goal? .....well security reasons are huge.
I won't elaborate past there.

## Scripts

The UFW script was never added and I need to rewrite it as a result.
