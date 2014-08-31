`dwall`
=======

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

- `curl`

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

**Warning:** there's currently a bug with `shellescape`: a trailing
baskslash is appended to each line.

Add the following to your vimrc:

```vim
function! Dwall(line1, line2, ...) range
    let buffer=join(getline(a:line1, a:line2), "\n")
    let args=(a:0 > 0) ? a:0 : ''
    echom system('echo '.shellescape(buffer).' | dwall '.args)
endfunction

command! -nargs=? -range=% Dwall :call Dwall(<line1>, <line2>, <f-args>)
```

Then you can use it like this (while being in a file buffer):

```
:Dwall -title -l php 'Foo script'
```

It will print the paste URL in the bottom line.
