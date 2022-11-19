vim-less.txt
=============
A syntax (color highlighting) script for ``*.list`` files with a generic set
of tag formats and a particular line structure.

Inspired by todo.txt. So highlighted parts include:

- (<priority>)
- @<context>
- +<context>
- <key>:<value>
- #<refid>


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
