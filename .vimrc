call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'Shougo/neocomplcache.vim'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
call plug#end()

filetype plugin indent on
syntax enable

" display the command state
set showmode
set ts=2 sw=2 sts=0
set tw=0
set backspace=2
set listchars=tab:\ \
set list
set scrolloff=8
set sidescrolloff=8

set showmatch           " Show matching brackets.
set showcmd             " Show (partial) command in status line.
set autowrite           " Automatically save before commands like :next and :make
set ignorecase
set noai
set vb t_vb=

colorscheme pablo

" display cursor's line/column
set ruler

" ignore the ignorecase option if the user went to the trouble of
" entering uppercase characters.
set ignorecase

" incremental search - shows what was found
set incsearch

" highlights what it found
set hlsearch

" show status line
set laststatus=2
set guifontset=-*-fixed-medium-r-normal--16-*-*-*-c-*,*-r-*
set statusline=[%n]\ %F\ %y%{GetStatusEx()}\ %m%h%r=%l/%L,%c%V\ %P

function! GetStatusEx()
    let str = &fileformat
    if has("multi_byte") && &fileencoding != ""
        let str = &fileencoding . ":" . str
    endif
    let str = "[" . str . "]"
    return str
endfunction

" do not make backup file
set nobk

set expandtab
let fortran_free_source=1
let fortran_do_enddo=1
let fortran_more_precise=1

" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options

set background=dark

if has("syntax")
  syntax on
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,sjis
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  " iconvがJISX0213に対応しているかをチェック
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  " fileencodingsを構築
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^euc-\%(jp\|jisx0213\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      let &encoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
au BufRead,BufNewFile *.jcl set filetype=jcl
au BufRead,BufNewFile *.jdf set filetype=jdf

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" eskk
" https://alwei.hatenadiary.org/entry/20111029/1319905783
let g:eskk#directory = "~/.eskk"
let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
set imdisable
let g:eskk#enable_completion = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1

imap <C-@> <C-[>
nnoremap <C-h> <Left>
nnoremap <C-j> <Down>
nnoremap <C-k> <Up>
nnoremap <C-l> <Right>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMinimalUI=1
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

let errorformat =  '%E%f(%l): error #%n: %m,'
let errorformat .= '%W%f(%l): warning #%n: %m,'
let errorformat .= '%I%f(%l): remark #%n: %m,'
let errorformat .= '%-C  %#%.%#,'
let errorformat .= '%-Z%p^'

autocmd FileType * setlocal textwidth=0
