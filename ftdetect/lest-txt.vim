" File: ftdetect/lest-txt.vim
" Description: Filetype detection for lest.txt
" Author: B. van Berkum <dev@dotmpe.com>
" License: Vim license
" Website: http://github.com/dotmpe/vim-lest.txt
" Version: 0.1.3-dev

autocmd BufNewFile,BufRead *.lst *.list  set filetype=lest-txt
