Deblan Wall Upload
==================

Upload a text file on [Deblan wall service](https://wall.deblan.org/).

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
curl -kL wall.deblan.org | xidel - --css "#adding-language > button" -e "css('#adding-language > button')/@value" 2> /dev/null | pr -2
```

A typical output at this time is the following.

<table>
  <tbody>
    <tr><td>HTML</td><td>html</td></tr>
    <tr><td>XML</td><td>xml</td></tr>
    <tr><td>CSS</td><td>css</td></tr>
    <tr><td>JAVASCRIPT</td><td>javascript</td></tr>
    <tr><td>PHP</td><td>php</td></tr>
    <tr><td>SQL</td><td>sql</td></tr>
    <tr><td>YAML</td><td>yaml</td></tr>
    <tr><td>PERL</td><td>perl</td></tr>
    <tr><td>C/C++</td><td>c</td></tr>
    <tr><td>ASP</td><td>asp</td></tr>
    <tr><td>PYTHON</td><td>python</td></tr>
    <tr><td>BASH</td><td>bash</td></tr>
    <tr><td>ACTION SCRIPT</td><td>actionscript</td></tr>
    <tr><td>TEXTE</td><td>texte</td></tr>
  </tbody>
</table>

Example
-------

```sh
deblan-wall-up foo.php php "Foo script"
```
