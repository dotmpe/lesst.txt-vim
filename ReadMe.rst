vim-lest.txt
=============
A syntax (color highlighting) script for a custom, generic text/line-based list
format inspired by TODO.txt. Highlighted parts include:

- Different types of line based, \*nix style comments and with contained
  highlight groups as well.

- Separate number number "spec" column group left and free-form text fields to
  the right, starting with key: label text fields.

Also tags from TODO.txt:

- (<priority>) to mark numeric or alphabetically ordered classifications or rankings
- @<context> to 'tag' entry using another, global Id
- +<context> to tell the entry belongs to a project
- <key>:<value> to add meta properties
- #<refid>
- <<urls>>

- `...`
- ``...``
- ```...```

- '...'
- ''...''
- '''...'''

- "..."
- ""...""
- """..."""

Objectives
----------
- probably split line into record part (space delimited columns),
  followed by variable width text part.

  First only contains numerical characters, spaces and some characters
  commonly used in numeral notations (not hexadecimals |--| actual roman
  numeral characters) and ',.-+'

  First characters after record part could indicate some sort of (non-numerica)
  record key.

- supports comments, distinguishes preprocessing directives, and shows
  line-continuations.

- allows for preformatted parts too? (ie. after certain continuations)

- can use comments for file and block-level metadata


Status
------
[2022-08-10] Initial Vim syntax file.

..
