Deblan Wall Upload
==================

Upload a text file on Deblan wall service.

Description
-----------

Uses cURL to upload code on Deblan, with given language and description.

Dependencies
------------

- `curl`

Options
-------

1. Input file
1. Language (optional)
1. Title (optional)

Languages
---------

Use this command to get the supported languages (using [Xidel](http://videlibri.sourceforge.net/xidel.html)
to extract data from HTML).

```sh
curl -kL wall.deblan.org \
    | xidel \
        - \
        --css "#adding-language > button" \
        -e "css('#adding-language > button')/@value" \
        2> /dev/null \
    | pr -2 -s, -T \
    | column -s, -t
```

A typical output at this time is the following.

    HTML           html
    XML            xml
    CSS            css
    JAVASCRIPT     javascript
    PHP            php
    SQL            sql
    YAML           yaml
    PERL           perl
    C/C++          c
    ASP            asp
    PYTHON         python
    BASH           bash
    ACTION SCRIPT  actionscript
    TEXTE          texte

Example
-------

```sh
deblan-wall-up foo.php php "Foo script"
```
