" Id: vim-lest.txt/0.1-dev lest-txt.vim
" File: syntax/lest-txt.vim
" Description: Text list syntax settings
" Author: B. van Berkum <dev@dotmpe.com>
" License: Vim license
" Website: http://github.com/dotmpe/vim-lest.txt
" Version: 0.1.3-dev

if exists("b:current_syntax")
 finish
endif

" Lets simplify this a bit
"syntax case ignore

" Introduce our pre-processor directives as new keywords
" XXX:
"syntax keyword PreProc #incl[ude] #cols #columns #sch[eme]


""" Region, match and cluster definitions

" Basic comment line, does not match directives

" FIXME: what scope and file should parameters go...
let allow_empty_comments = 0

syntax match HashCommentLineEmpty '^ *#\+ *$'
if allow_empty_comments
  syntax match HashCommentLine '^ *#\+\( .\+\)\?$' contains=@PlainTag,@EntryFields
else
  syntax match HashCommentLine '^ *#\+ .\+$' contains=@PlainTag,@EntryFields
endif

syntax match HighPriorityId '([1-2a-h][0-9 \.-]\+)' contained contains=NumeralId
syntax match MedPriorityId '([3-5i-p][0-9 \.-]\+)' contained contains=NumeralId
syntax match LowPriorityId '([6-9q-z][0-9 \.-]\+)' contained contains=NumeralId
syntax match UnPriorityId '(0[0-9 \.-]\+)' contained contains=NumeralId
syntax cluster PriorityId contains=HighPriorityId,MedPriorityId,LowPriorityId,UnPriorityId

syntax match HexNumeralId '[ :=]\zs[0-9bx\.\+-][0-9a-fei,/^\.\+-]\+' contained
syntax match NumeralId '[ :=(]\zs[0-9b\.\+-][0-9ei,/^\.\+-]\+' contained
syntax match FieldId '[A-Za-z0-9 \.-]\+' contained

syntax cluster EntryFields contains=@PriorityId,GlobalRef,ClassTag,PlainTag,HashTag,ProjectTag,PathField,MetaField,VarField,NumeralId,LineContinuation
syntax cluster ClosedEntry contains=ClassTag,PathField,NumeralId,LineContinuation
 
syntax match ClosedEntry '^ *x .*$' contains=@ClosedEntry
"syntax match CommentEntry '^ *#- .*$' contains=@EntryFields
syntax match CommentEntry '^ *# [A-Za-z0-9 \.-]\+: .*$' contains=@PlainTag,FieldId,@EntryFields
syntax match IndentedEntry '^ \+.*$' contains=@PlainTag,ListStat,@EntryFields

syntax match IdPrefix '[A-Z]\{2,\}:' contained
syntax match ListStat '^[0-9e:,.+ -]\+' contained contains=ListStatNA
syntax match ListStatNA '\(^\|\s\)-' contained
syntax match ListDate '\(^\|\s\)\d\{8\}\>' contains=ListDate

"syntax cluster ListEntryFields contains=MetaTag,MetaValue,PlainTag


syntax cluster PlainTag contains=PlainTODO,PlainFIXME,PlainXXX,PlainBUG,PlainNOTE
syntax match PlainBUG '\<BUG\>' contained
syntax match PlainFIXME '\<FIXME\>' contained
syntax match PlainNOTE '\<NOTE\>' contained
syntax match PlainTODO '\<TODO\>' contained
syntax match PlainXXX '\<XXX\>' contained

syntax match ClassTag '@[A-Za-z_][A-Za-z0-9+:\./_-]\+' contained contains=MetaField
syntax match ProjectTag '+[A-Za-z_][A-Za-z0-9_-]\+' contained
syntax match HashTag '#[A-Za-z_][A-Za-z0-9_-]\+' contained
syntax match GlobalRef '<[^>]\+>' contained

syntax match MetaField '[^ ]\+:[^: ]\+:\?\($\|\s\)' contained contains=MetaTag,MetaValue,PathField,VarField
syntax match MetaTag '[A-Za-z0-9_-]\+:' contained
syntax match MetaValue '[^: ]\+\($\|\s\)' contained contains=@QuotedValue

syntax match PathField '[A-Za-z0-9\./_-]\+/[A-Za-z0-9_-]\+/\?' contained contains=PathName
syntax match PathName '[A-Za-z0-9_-]\+\($\|\s\)' contained

syntax match VarField '[A-Za-z0-9\./_-]\+=[^/: ]*' contained contains=VarTag,VarValue
syntax match VarTag '[A-Za-z0-9_-]\+=' contained
syntax match VarValue '[A-Za-z0-9_-]\+\($\|\s\)' contained


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

"syntax match ListVId '[A-Za-z_][A-Za-z0-9_-]\+\W\+' contained contains=ListNumeric,ListNumerals

"syntax match ListNumeric '\(^\|\W\)[0-9][0-9,\/\.\+-]*\($\|\W\|[A-Za-z0-9\/\^]\{1,9\}\)' contains=ListNumeral
"syntax match ListNumeric '[0-9][0-9,\/\.\+-]*\($\|\W\|[A-Za-z0-9\/\^]\{1,9\}\)' contains=ListNumeral
"syntax match ListNumeral '[0-9]\+' contained
"
syntax match ListEntry '^[0-9e:,.+-][0-9e:,.+ -]\+ .*$' contains=ListStat,ListEntryId,@EntryFields
syntax match ListEntryId '\([A-Z]\{2,\}:\)\?[^:]\+:\($\| \)' contained contains=IdPrefix


""" Highight links


" Re-assign standard Vim link groups
"highlight link PreProc SignColumn
"highlight link PreProc Number
"highlight default link PreProc SpecialComment


" Assign our matches and regions to syntax highlight groups

highlight default link CommentEntry Comment
highlight default link ClosedEntry Comment
highlight default link HashCommentLine Comment
highlight default link HashCommentLineEmpty Warning

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

highlight default link UnPriorityId Warning
highlight default link MedPriorityId IncSearch
highlight default link HighPriorityId Search
highlight default link LowPriorityId Special
highlight default link NumeralId Number
highlight default link HexNumeralId Number

highlight default link ListEntryId Directory
highlight default link IdPrefix Type

highlight default link Quoted String
highlight default link Quoted3 String
highlight default link QuotedAngle String
highlight default link QuotedAngle3 String
highlight default link QuotedDouble String
highlight default link QuotedDouble3 String

highlight default link ListStat SpecialKey
highlight default link ListStatNA PreProc
highlight default link ListVId Type

highlight default link HashTag Character
highlight default link ProjectTag SpecialKey
highlight default link GlobalRef SpecialComment
highlight default link ClassTag Identifier

highlight default link VarField SpecialComment
highlight default link VarTag Label
highlight default link VarValue Tag

highlight default link PathField Warning
highlight default link PathName SpecialComment

highlight default link MetaField Character
highlight default link MetaTag Directory
highlight default link MetaValue String
highlight default link MetaTagComment SpecialComment

highlight default link PlainBUG CursorLineNr
highlight default link PlainFIXME StatusLine
highlight default link PlainNOTE CursorLine
highlight default link PlainTODO Normal
highlight default link PlainXXX StatusLineNC


"highlight default link MetaTag Type
" XXX: Add our own link groups?


let b:current_syntax = "lest-txt"
