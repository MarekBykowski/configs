execute pathogen#infect()
syntax on
set title
set bg=dark
set showcmd

"from kernel for newbies
filetype plugin indent on

syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
syn keyword cOperator likely unlikely

set softtabstop=8
set noexpandtab                         " use tabs, not spaces
set tabstop=8                           " tabstops of 8
set shiftwidth=8                        " indents of 8
set textwidth=78                        " screen in 80 columns wide, wrap at 78
set colorcolumn=80			" colored line at <val>

set autoindent smartindent              " turn on auto/smart indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & start
"end of kernel for newbies

set ignorecase
set smartcase
set foldmethod=marker

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

"clear trailing while spaces (disliking it)
":%s/\s\+$//e
:command! Wc %s/\s\+$//e

" fold at 8- and color above
" set textwidth=75
"autocmd BufWinEnter * call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1)

" spell check
set spelllang=en
"setlocal spell or setlocal nospell

":set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
"syntax match Tab /\t/
"hi Tab gui=underline guifg=blue ctermbg=blue

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    "autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
