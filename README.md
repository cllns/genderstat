demasc - a text analyzer for gendered language
======
More specifically, calclulates the amount (in terms of percentages and relative ratios) of gendered language in a file or on a site. 
It counts the number of words like "he","his","him", etc. and compares it to the number of words like "she", "hers", "her", etc.

Why?
----
Because gendered language reinforces sexism.

Example
-------
    ruby demasc.rb [FILE]
or
    ruby demasc.rb [URL]

The ralph-waldo-emerson.txt file is a collection of his essays and kate-chopin.txt is her story The Awakening and other short stories.    
    $ ./demasc.rb ralph-waldo-emerson.txt 
    reading in file: ralph-waldo-emerson.txt
    
    total words:     77181
    masculine words: 1798
    feminine words:  79
    neutral words:   1524
    
    masculine words: 2.33%
    feminine words: 0.10%
    neutral words: 1.97%
    22.76 times as many masculine words are feminine words


    $ ./demasc.rb kate-chopin.txt 
    reading in file: kate-chopin.txt
    
    total words:     67024
    masculine words: 1705
    feminine words:  3125
    neutral words:   961
    
    masculine words: 2.54%
    feminine words: 4.66%
    neutral words: 1.43%
    1.83 times as many feminine words as masculine words


    $ ./demasc.rb feministing.com
    reading in website: http://feministing.com
    
    total words:     4511
    masculine words: 4
    feminine words:  21
    neutral words:   15
    
    masculine words: 0.09%
    feminine words: 0.47%
    neutral words: 0.33%
    5.25 times as many feminine words as masculine words


    $ ./demasc.rb stallman.org
    reading in website: http://stallman.org
    
    total words:     9440
    masculine words: 22
    feminine words:  2
    neutral words:   74
    
    masculine words: 0.23%
    feminine words: 0.02%
    neutral words: 0.78%
    11.00 times as many masculine words as feminine words
    

Dependencies
------------
- [ruby-readability](https://github.com/iterationlabs/ruby-readability) - Required for URL's

Contribute
----------
Send a pull request or let me know of any feature requests. 
The wordlists could use work I'm sure.
