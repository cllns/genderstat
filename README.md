genderstat - a text analyzer for gendered language
===
genderstat calculates the amount (in terms of percentages and relative ratios) of gendered language in a file or on a site.

Specifically, it counts the number of gendered:
- subject pronouns (she/he)
- object pronouns (her/him)
- possessives (hers/his)
- generic nouns (woman/man, girl/boy, womankind/mankind, etc)

It does so both in absolute numbers, and also calculates the percent.

Additionally, it offers the ratios of between each too (e.g. 3.2 times as many
masculine words as feminine words, etc).

Word Lists
---
genderstat comes with three wordlists:
- masculine_words.yaml
- feminine_words.yaml
- neutral_words.yaml

They're completely editable, and genderstat will calculate for any files in the
directory names ending with ```_words.yaml```


Example
-------
`ruby genderstat.rb [FILE]`

or

`ruby genderstat.rb [URL]`


### File example ###

The `ralph-waldo-emerson.txt` file is a collection of his essays and `kate-chopin.txt` is a collection of her stories (including The Awakening).
```
    $ ./genderstat.rb ralph-waldo-emerson.txt
    reading in file: ralph-waldo-emerson.txt

    total words:     77181
    masculine words: 1798
    feminine words:  79
    neutral words:   1524

    masculine words: 2.33%
    feminine words: 0.10%
    neutral words: 1.97%
    22.76 times as many masculine words are feminine words


    $ ./genderstat.rb kate-chopin.txt
    reading in file: kate-chopin.txt

    total words:     67024
    masculine words: 1705
    feminine words:  3125
    neutral words:   961

    masculine words: 2.54%
    feminine words: 4.66%
    neutral words: 1.43%
    1.83 times as many feminine words as masculine words
```


### URL example ###
```
    $ ./genderstat.rb feministing.com
    reading in website: http://feministing.com

    total words:     4511
    masculine words: 4
    feminine words:  21
    neutral words:   15

    masculine words: 0.09%
    feminine words: 0.47%
    neutral words: 0.33%
    5.25 times as many feminine words as masculine words


    $ ./genderstat.rb stallman.org
    reading in website: http://stallman.org

    total words:     9440
    masculine words: 22
    feminine words:  2
    neutral words:   74

    masculine words: 0.23%
    feminine words: 0.02%
    neutral words: 0.78%
    11.00 times as many masculine words as feminine words
```

todo
---
- Add test
- Make into a gem
- Add support for more stats (like statistical significance?)
- Add support for reading from stdin

Dependencies
------------
Ruby 2.0+

