" File:        ftdetect/lesst.txt.vim
" Description: Todo.txt filetype detection
" Author:      B. van Berkum <dev@dotmpe.com>
" License:     Vim license
" Website:     http://github.com/dotmpe/lesst.txt-vim
" Version:     0.1-dev

autocmd BufNewFile,BufRead *.list  set filetype=lesst-txt

