dwall
=====

> Upload a text file on [Deblan wall service](https://wall.deblan.org/).

Usage
-----

```
Usage: dwall [options] [<file>]

Arguments:
  <file>  File to upload, `stdin` by default.

Options:
  -h, --help                 Show this screen.
  -l, --language <language>  Programming language of the uploaded file.
  -t, --title <title>        Title of the paste.

```

Dependencies
------------

- curl

Languages
---------

Use this command to get the supported languages (using [Xidel][] to
extract data from HTML).

[Xidel]: http://videlibri.sourceforge.net/xidel.html

```sh
curl -kL wall.deblan.org \
  | xidel - \
      -e "css('#adding-language > button')/@value" \
      2> /dev/null \
  | pr -2
```

A typical output at this time is the following.

| Language      | Code         |
|---------------|--------------|
| HTML          | html         |
| XML           | xml          |
| CSS           | css          |
| JAVASCRIPT    | javascript   |
| PHP           | php          |
| SQL           | sql          |
| YAML          | yaml         |
| PERL          | perl         |
| C/C++         | c            |
| ASP           | asp          |
| PYTHON        | python       |
| BASH          | bash         |
| ACTION SCRIPT | actionscript |
| TEXTE         | texte        |

Examples
--------

```sh
dwall -l php -t 'Foo script' foo.php
```

Vim integration
---------------

This repository is also a valid Vim plugin. Just include it with your
favorite plugin manager.

It's basically a wrapper for the dwall command.

```
:Dwall -title -l php 'Foo script'
```

It will print the paste URL in the status line.
