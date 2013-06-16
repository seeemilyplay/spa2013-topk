accurate-topk
====================

An executable for accurately calculating the top occuring elements from
a newline separated stream of elements on STDIN.

##Building##

To build:

    $ cd spa2013-topk/accurate-topk
    $ cabal configure
    $ cabal build

Check it runs by calling:

   $ cat ../play-data/samples/prepared/tiny-places.txt | ./dist/build/accurate-topk/accurate-topk -k 5

Alternatively if you have the cabal bin on your path, for example on Ubuntu,
by adding `PATH=$PATH:$HOME/.cabal/bin` to your `.bashrc` then you can build with:

    $ cabal install

And run by simply calling:

    $ cat ../play-data/samples/prepared/tiny-places.txt | accurate-topk -k 5

##Running##

    Usage: accurate-topk [-k K]?

K is top number to find, by default this is 10.
