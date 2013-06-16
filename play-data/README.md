play-data
====================

An executable for generating play data.

##Building##

To build:

    $ cd spa2013-topk/play-data
    $ cabal configure
    $ cabal build

Check it runs by calling:

    $ ./dist/build/play-data/play-data samples/histogram/places.txt

Alternatively if you have the cabal bin on your path, for example on Ubuntu,
by adding `PATH=$PATH:$HOME/.cabal/bin` to your `.bashrc` then you can build with:

    $ cabal install

And run by simply calling:

    $ play-data samples/histogram/places.txt

##Running##

    Usage: play-data [-n NUM_ELEMENTS]? [-c NUM_CHUNKS]? [HISTOGRAM_FILE | count-histogram COUNT_HISTOGRAM_FILE]

NUM_ELEMENTS is the number of elements to output, and is by default 100.

NUM_CHUNKS is the number of chunks to split elements into, and is by default 1.
If the chunks were 2, say, then half the elements would come at the start of the stream
and the other half the elements would come at the end of the stream. This is good
for testing methods which are order sensitive.

##Histograms##

Histogram files are newline separated files of element and count pairs, for example:

    (Slough,1296)
    (Swindon,889)
    (Hull,12418)
    (Bath,4525)
    (Bristol,314765)

Play-data would use this histogram to create a random stream of places with a matching
distribution.

Samples can be found in samples/histogram.

##Count Histograms##

Count histogram files are useful for data with lots of elements. They are
newline separated files of counts and number of elements, for example:

    (1,197185)
    (2,103583)
    (3,70686)

This means that 197185 elements appeared once, 103583 elements appeared twice,
and 70686 elements appeared 3 times.

Play-data would use this count histogram to create a random stream of numbers with a
matching distribution.

Samples can be found in samples/count-histogram.

##Prepared Samples##

There are some prepared output samples in samples/prepared.
