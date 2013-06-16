my-topk
====================

A starting point for an  executable that estimates the top occuring elements
from a newline separated stream of elements on STDIN.

##Building##

To build:

    $ cd spa2013-topk/my-topk
    $ cabal configure
    $ cabal build

Check it runs by calling:

   $ cat ../play-data/samples/prepared/tiny-places.txt | ./dist/build/my-topk/accurate-topk -k 5

Alternatively if you have the cabal bin on your path, for example on Ubuntu,
by adding `PATH=$PATH:$HOME/.cabal/bin` to your `.bashrc` then you can build with:

    $ cabal install

And run by simply calling:

    $ cat ../play-data/samples/prepared/tiny-places.txt | my-topk -k 5

##Using##

Edit the code inside src/Main.hs.

##Developing with GHCI##

To make development easier you can load the Main.hs into GHCI, which is
an interactive environment for Haskell development. Start GHCI by calling:

    $ ghci

You will be given a command line prompt, from there you may call:

`:load src/Main.hs` to load the Main.hs

`topK 1 ["Paris", "Paris", "Hull"]` to call your topK function directly and
see the output

`:reload` to reload your Main.hs after editing

`:quit` to leave GHCI