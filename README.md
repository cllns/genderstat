genderstat
===
genderstat calculates the amount (in terms of percentages and relative ratios) of gendered language in a file or on a site.

Specifically, it counts the number of gendered:
- subject pronouns (she/he)
- object pronouns (her/him)
- possessives (hers/his)
- generic nouns (woman/man, girl/boy, womankind/mankind, etc)

It does so both in absolute numbers, and also calculates the percent.

Additionally, it offers the ratios of between each too (e.g. 3.2 times as many
masculine words as feminine words).

Word Lists
---
genderstat comes with three wordlists:
- ```masculine_words.yaml```
- ```feminine_words.yaml```
- ```neutral_words.yaml```

They're completely editable, and genderstat will calculate for any files in the
directory names ending with ```_words.yaml```


Example
-------
`ruby -Ilib bin/genderstat [FILE]`

or

`ruby -Ilib bin/genderstat [URL]`


### File example ###

The `ralph-waldo-emerson.txt` file is a collection of his essays and `kate-chopin.txt` is a collection of her stories (including The Awakening).
```
    % ruby -Ilib bin/genderstat ralph-waldo-emerson.txt
    total words: 77181
    feminine words: 85
    masculine words: 1942
    neutral words: 1714

    feminine words: 0.11%
    masculine words: 2.52%
    neutral words: 2.22%

    The ratio of feminine to masculine words is 0.04
    The ratio of feminine to neutral words is 0.05
    The ratio of masculine to feminine words is 22.85
    The ratio of masculine to neutral words is 1.13
    The ratio of neutral to feminine words is 20.16
    The ratio of neutral to masculine words is 0.88


    % ruby -Ilib bin/genderstat kate-chopin.txt
    total words: 67023
    feminine words: 3147
    masculine words: 1724
    neutral words: 1095

    feminine words: 4.7%
    masculine words: 2.57%
    neutral words: 1.63%

    The ratio of feminine to masculine words is 1.83
    The ratio of feminine to neutral words is 2.87
    The ratio of masculine to feminine words is 0.55
    The ratio of masculine to neutral words is 1.57
    The ratio of neutral to feminine words is 0.35
    The ratio of neutral to masculine words is 0.64
```

### URL example ###
```
    % ruby -Ilib bin/genderstat feministing.com
    total words: 4908
    feminine words: 20
    masculine words: 3
    neutral words: 17

    feminine words: 0.41%
    masculine words: 0.06%
    neutral words: 0.35%

    The ratio of feminine to masculine words is 6.67
    The ratio of feminine to neutral words is 1.18
    The ratio of masculine to feminine words is 0.15
    The ratio of masculine to neutral words is 0.18
    The ratio of neutral to feminine words is 0.85
    The ratio of neutral to masculine words is 5.67

    %ruby -Ilib bin/genderstat stallman.org
    total words: 5673
    feminine words: 1
    masculine words: 16
    neutral words: 55

    feminine words: 0.02%
    masculine words: 0.28%
    neutral words: 0.97%

    The ratio of feminine to masculine words is 0.06
    The ratio of feminine to neutral words is 0.02
    The ratio of masculine to feminine words is 16.0
    The ratio of masculine to neutral words is 0.29
    The ratio of neutral to feminine words is 55.0
    The ratio of neutral to masculine words is 3.44
```
todo
---
- Add tests
- Make into a gem
- Add support for more stats (like statistical significance?)
- Add support for reading from stdin
- Handle scenario of https->redirect (rather than weird nil error)

Dependencies
------------
- Ruby 2.0+
- ```open_uri_redirections``` gem

You can get the gem by running ```bundle update```. It's not strictly necessary,
it's just helpful for HTTP->HTTPS redirections.

