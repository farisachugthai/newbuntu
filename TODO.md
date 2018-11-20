# TODO

## Refactor

Move everything out of NewParrot into bin.

Unfortunately almost everything in bin is garbage. So clean that up first.

Then see if it'd be easier to just rewrite these scripts in python.

You could make a requests_download() function, throw it in utils and import it
instead of rewriting it every time.

Then it'd be easier to make a UI as well.

## First things first

We can take this pretty easy at first though.

1.) Review argparse and numpy docstrings. That should be plenty to start.

Like we won't even need to move around the stuff in bin and NewParrot as long as
you can port it to python. Ya know?
