A syntax (color highlighting) script for ``*.list`` files with a particular format.

The format:

- holds lines of tabular, numerically encoded data followed by free-form values
- somewhat readable but mostly editable and compact
- supports comments and preprocessing directives

list.txt format
---------------
Each line is a list item, but with the item value is preceded by 'any' number of descriptor fields or attributes, that are not part of the value.

This is the 'stats' part and the 'record' part of a list item.
The format was inspired by TODO.txt files, that have (only) 1-4 such fields.

What is in the record part this format does not say.
It can be simple or complex depending on the application.

The stats part holds only 0-9 numeral chararacts separated by spaces, and only just a few select non-numeral ordinals ('-+e:.,/') to support for different notations.
As such this 'record descriptor'-type part can hold almost any numerical notation, time, coordinate, real, imaginary, fraction, etc.
Also use '-' for null or n/a values.
It only does not hold hexadecimals. Octal should work.
So not for really large, exact numbers like hashes.

TODO: current scripts allow for '+-.' I think or even less.

Because there are other types of values (like hexadecimals) that we might want to include in the line as well, also apart from the value... somehow.
It is tempting to divide the record part up as well,
so we have a 'descriptor' part aside from an item value possibly.

But have not really went there. At this point is seems sensible the record part
might contain TODO.txt parts (e.g. tag and project references, meta k/v fields, urls, etc.) for highlighting.

Want to focus on

- try to allow continuations
- not be a generic table format.
  Still sort-off a more maintainable alt. to CSV (depending on users' editor).
- have metadata for parser/processor:

  - to get fixed/min/max stat col-count for file
  - to get column specs: id's/types/descriptions
  - same for record part, may be later..

..
