"====================================VUNDLE====================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"=================================VUNDLE REPO==================================
"""Vundle selfupdate
Bundle 'gmarik/vundle'

""""""Tpope repos
"""Git supports
Bundle 'tpope/vim-fugitive'
"""Date inc/dec (Alt-a/Alt-x)
Bundle 'tpope/vim-speeddating'
"""Surround parenthese, brackets, quotes, XML tags and more
Bundle 'tpope/vim-surround'
"""Mapping simply short normal mode aliases
Bundle 'tpope/vim-unimpaired'
"""Repeat for surround, speeddating, abolish, unimpaired, commentary
Bundle 'tpope/vim-repeat'

""""""Vim-scripts repos
"""LaTeX
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'LaTeX-Box'
"""Sniplets
Bundle 'snipMate'
"""Fast toggle commets
Bundle 'The-NERD-Commenter'
"""Ctags supports
Bundle 'ctags.vim'
"""Ascii art
Bundle 'DrawIt'

""""""Other repos
"""Super syntax
Bundle 'scrooloose/syntastic'
"""Tree file viwer
Bundle 'scrooloose/nerdtree'
"""Status bar
Bundle 'itchyny/lightline.vim'
"""Google calendar
Bundle 'itchyny/calendar.vim'
"""Visualize UNDO tree
Bundle 'sjl/gundo.vim'
"""Color themes
Bundle 'platinumthinker/vim-colors-solarized'
"""Ack supports
Bundle 'mileszs/ack.vim'
"""Markdown folding
Bundle 'nelstrom/vim-markdown-folding'
"""Autocomplite
Bundle 'Valloric/YouCompleteMe'
"""Bar of function in open file (from ctags)
Bundle 'majutsushi/tagbar'
"""Dublicate character (quotes, brackets, ets)
Bundle 'Raimondi/delimitMate'
"""Seacher
Bundle 'kien/ctrlp.vim'
"""Erlang autocomplite and show error
Bundle 'oscarh/vimerl'

"==================================VIM CONFIG==================================
let $BASH_ENV = "~/.bash_profile"
set shell=/bin/zsh
filetype plugin indent on

set helplang=ru,en
set title
set cursorline
set cursorcolumn
set nocompatible
" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250 
" игнорировать регистр при поиске
set ignorecase
" подсвечивать поиск
set hlsearch
" show matches while typing
set incsearch
"" Fix for russian world 
set iskeyword=@,48-57,_,192-255
"" Number of visual spaces per TAB
set tabstop=4
"" Number of spaces in TAB when editing
set softtabstop=4
"" Tabs replaced on spaces
set expandtab
set smarttab

set showmatch " Show matching brackets.

set autoindent
set cindent
set indentkeys-=0# " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

"" Show command in bottom bar
set showcmd 
" перенос по словам, а не по буквам
set linebreak
set dy=lastline
"" Show line number
set number
"" Wrap lines by 80 char 
set wrap
set textwidth=80
set colorcolumn=80

set shiftwidth=4
" round indent to multiple of 'shiftwidth'
set shiftround 
set mouse=a
" Yanks go on clipboard instead
set clipboard+=unnamed

set modeline
set modelines=5 " default numbers of lines to read for modeline instructions

set completeopt=menu,menuone,longest
set pumheight=15

set wildmode=list:longest,full
set wildmenu 
set wildignore+=.git,.svn

let g:erlang_folding=1
"let g:erlangRefactoring=1
"let erlang_show_errors=0
let	g:erlangHighlightBif=1 
let g:erlangCompletionDisplayDoc = 0
let g:erlangCompletitionGrep = 'ack'
let g:erlangFoldSplitFunction=1
let g:erlangManPath="/home/thinker/erlware/man"
let g:erlangHighlightErrors=0


if version >= 700
    set history=256
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

""Backup
set backup
set backupdir=/var/tmp,/tmp
set backupskip=/tmp/*
set directory=/var/tmp,/tmp
set writebackup

let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')

"setlocal spell spelllang=en_us

"Markdown fix
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

"Folds
set foldmethod=syntax
let g:markdown_fold_style = 'nested'

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=4

let g:tagbar_autofocus = 1

"================================KEY BINDINGS==================================
inoremap jj <ESC>
"Open/close folds
nnoremap <Space> za 

map <silent><BS> :NERDTreeToggle<CR>

""Toggle gundo
nnoremap <silent><leader>u :GundoToggle<CR>
inoremap <silent><leader>u :GundoToggle<CR>

nnoremap <tab> <C-w><C-w>  

nnoremap <silent> <F4> :lclose<CR>
"Next error
nnoremap <silent><F2> :lnext<CR> 
inoremap <silent><F2> :lnext<CR> 
"Previous error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> :lprevious<CR>

nnoremap <silent><F8> :TagbarToggle<CR>
inoremap <silent><F8> :TagbarToggle<CR>

call togglebg#map("<F5>")

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

inoremap <tab> <C-p>

""Edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
""Load vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
""Save session (load: vim -S)
nnoremap <leader>s :mksession<CR>

"===============================GOOGLE CALENDAR================================
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_first_day = "monday"
"===================================NERDTREE===================================
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                    \ '.*\.midi$']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

augroup ps_nerdtree
    au!
    au Filetype nerdtree setlocal nolist
    au Filetype nerdtree nnoremap <buffer> H :vertical resize -10<cr>
    au Filetype nerdtree nnoremap <buffer> L :vertical resize +10<cr>
    " au Filety
"===============================FIX SLOW SCROLL================================
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
"================================GUNDO SETTINGS================================
let g:gundo_disable = 0
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
let g:gundo_help = 1
"==============================SOLORIZED THEME UP==============================
if !has('gui_running')
    let g:Powerline_symbols = 'fancy'
    set t_Co=256
endif
syntax enable
colorscheme solarized
set background=dark
"let g:solarized_termcolors = 256
let g:solarized_contrast = 'hight'
let g:solarized_visibility = 'high'
"============================STATUS BAR SETTINGS UP============================
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? ' ' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ 'NERD_tree' ? '' :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? ' '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline = 1
let g:vimfiler_force_overwrite_statusline = 1
let g:vimshell_force_overwrite_statusline = 1
