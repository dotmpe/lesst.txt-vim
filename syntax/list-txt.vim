" File: syntax/list.txt.vim
" Description: Text list syntax settings
" Author: B. van Berkum <dev@dotmpe.com>
" License: Vim license
" Website: http://github.com/dotmpe/list.txt-vim
" Version: 0.1-dev

if exists("b:current_syntax")
 finish
endif

" Lets simplify this a bit
syntax case ignore

" Introduce our pre-processor directives as new keywords
" XXX:
"syntax keyword PreProc #incl[ude] #cols #columns #sch[eme]


""" Region, match and cluster definitions

" Basic comment line, does not match directives
syntax match HashCommentLine '^ *#[ #]\+.\+$' contains=@PlainTag,MetaField,LineContinuation

" Directives always at start of line, and are not comments
syntax match ListDirective '^#[^ #]\+.*$' contains=@ListDirType,ListDirArgument

syntax cluster ListDirType contains=ListDirTypeIncl,ListDirTypeCols,ListDirTypeSch

syntax match ListDirTypeIncl '\<incl\(ude\)\?\>' contained
syntax match ListDirTypeCols '\<col\(umn\)\?s\>' contained
syntax match ListDirTypeSch '\<sch\(eme\)\?\>' contained

syntax match ListDirArgument ' [^ ]\+$' contained contains=@ListDirRefTypes

syntax cluster ListDirRefTypes contains=ListDirValLookupRef,ListDirValTitleRef,ListDirValTagRef

syntax match ListDirValLookupRef '<\zs[^>]\+' contained
syntax match ListDirValTitleRef '"\zs[^"]\+' contained
syntax match ListDirValTagRef '[A-Za-z_][A-Za-z0-9_-]\+' contained

syntax cluster PlainTag contains=PlainTODO,PlainFIXME,PlainXXX,PlainBUG,PlainNOTE
syntax match PlainBUG '\<BUG\>' contained
syntax match PlainFIXME '\<FIXME\>' contained
syntax match PlainNOTE '\<NOTE\>' contained
syntax match PlainTODO '\<TODO\>' contained
syntax match PlainXXX '\<XXX\>' contained

syntax match MetaField '@[^:]\+: .*$' contained contains=MetaTag,MetaValue
syntax match MetaTag '@[A-Za-z_][A-Za-z0-9_-]\+' contained
syntax match MetaValue ': .*$' contained contains=@QuotedValue

"syntax match ListVId '[A-Za-z_][A-Za-z0-9_-]\+\W\+' contained contains=ListNumeric,ListNumerals

"syntax match ListNumeric '\(^\|\W\)[0-9][0-9,\/\.\+-]*\($\|\W\|[A-Za-z0-9\/\^]\{1,9\}\)' contains=ListNumeral
"syntax match ListNumeric '[0-9][0-9,\/\.\+-]*\($\|\W\|[A-Za-z0-9\/\^]\{1,9\}\)' contains=ListNumeral
"syntax match ListNumeral '[0-9]\+' contained
"
syntax match ListStat '^[0-9e:,.+ -]\+' contains=ListStatNA
syntax match ListStatNA '\(^\|\s\)-' contained

syntax match ListDate '\(^\|\s\)\d\{2,8\}\>' contains=ListDate

syntax cluster QuotedValue contains=@SingleQuoted,@AngleQuoted,@DoubleQuoted
syntax cluster SingleQuoted contains=Quoted,Quoted3
syntax cluster AngleQuoted contains=QuotedAngle,QuotedAngle3
syntax cluster DoubleQuoted contains=QuotedDouble,QuotedDouble3

" FIXME: should be using regions here
" Colour quoted values serpatedly at various levels
syntax match Quoted '\s*\'[^\']*\'' contained
syntax match Quoted3 '\s*\'\'\'[^\']*\'\'\'' contained
syntax match QuotedAngle '\s*`[^`]*`' contained
syntax match QuotedAngle3 '\s*```[^`]*```' contained
syntax match QuotedDouble '\s*"[^"]*"' contained
syntax match QuotedDouble3 '\s*"""[^"]*"""' contained

syntax match LineContinuation '\\$'



""" Highight links


" Re-assign standard Vim link groups
"highlight link PreProc SignColumn
"highlight link PreProc Number
"highlight default link PreProc SpecialComment


" Assign our matches and regions to syntax highlight groups

highlight default link HashCommentLine Comment

highlight default link LineContinuation Warning

highlight default link ListDirective PreProc
"highlight default link @ListDirType SpecialKey
highlight default link ListDirTypeCols SpecialKey
highlight default link ListDirTypeIncl SpecialKey
highlight default link ListDirTypeSch SpecialKey
highlight default link ListDirArgument Special
highlight default link ListDirValLookupRef Identifier
highlight default link ListDirValTitleRef String
highlight default link ListDirValTagRef Identifier

highlight default link ListDate PreProc
highlight default link ListNumeric Number
highlight default link ListNumeral Type

highlight default link Quoted String
highlight default link Quoted3 String
highlight default link QuotedAngle String
highlight default link QuotedAngle3 String
highlight default link QuotedDouble String
highlight default link QuotedDouble3 String

highlight default link ListStat SpecialKey
highlight default link ListStatNA PreProc
highlight default link ListVId Type

highlight default link MetaTag SpecialKey
highlight default link MetaTagComment SpecialComment

highlight default link PlainBUG CursorLineNr
highlight default link PlainFIXME StatusLine
highlight default link PlainNOTE CursorLine
highlight default link PlainTODO Normal
highlight default link PlainXXX StatusLineNC


"highlight default link MetaTag Type
" XXX: Add our own link groups?


let b:current_syntax = "list"

" Id: list.txt-vim/0.1-dev list.txt.vim
