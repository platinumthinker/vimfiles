"====================================VUNDLE====================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
"=================================VUNDLE REPO==================================
"""Vundle selfupdate
Bundle 'gmarik/vundle'

""""""Tpope repos
"""Comment supports
Bundle 'tpope/vim-commentary'
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
Bundle 'SirVer/ultisnips'
"""Fast toggle commets
Bundle 'The-NERD-Commenter'
"""Ctags supports
Bundle 'ctags.vim'
"""Ascii art
Bundle 'DrawIt'
"""GDB command interface
Bundle 'Conque-GDB'

""""""Other repos
"""Draw undo tree
Bundle 'mbbill/undotree'
"""Super syntax
Bundle 'scrooloose/syntastic'
"""Status bar
Bundle 'itchyny/lightline.vim'
"""Google calendar
Bundle 'itchyny/calendar.vim'
"""Color themes
Bundle 'platinumthinker/vim-colors-solarized'
"""Ack supports
Bundle 'mileszs/ack.vim'
"""Autocomplite
Bundle 'Valloric/YouCompleteMe'
"""Bar of function in open file (from ctags)
Bundle 'majutsushi/tagbar'
"""Dublicate character (quotes, brackets, ets)
Bundle 'Raimondi/delimitMate'
"""Seacher
Bundle 'kien/ctrlp.vim'
"""Align
Bundle 'junegunn/vim-easy-align'
"""Erlang autocomplite and show error
Bundle 'oscarh/vimerl'

"==================================VIM CONFIG==================================
let $BASH_ENV = "~/.bash_profile"
set shell=/bin/zsh

set helplang=en
set title
set cursorline
set cursorcolumn
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
set rnu
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

""Set varible from my envirmoment
let &path = &path . "," . getcwd()
let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')

""Spelli cheker
setlocal spell spelllang=en_us,ru_yo

""Add russian keyboard for commands
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"Markdown fix
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

"Folds
set foldmethod=syntax

let g:tagbar_autofocus = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_always_populate_location_list = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:UltiSnipsExpandTrigger = "<c-j>"

"let g:UltiSnipsJumpForwardTrigger
"let g:UltiSnipsJumpBackwardTrigger
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

nnoremap <tab> <C-w><C-w>  

nnoremap <F8> :TagbarToggle<CR>
inoremap <F8> :TagbarToggle<CR>

call togglebg#map("<F5>")

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

""Edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
""Load vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>u :UndotreeToggle<CR>
"===============================GOOGLE CALENDAR================================
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_first_day = "monday"
let g:calendar_calendar= "russia"
"====================================CTRL_P====================================
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 10
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(so|pyc|pdf)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
            \ }
"==================================SYNTASTICS==================================
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_mode_map = { 'mode': 'active',
            \'active_filetypes': ['erl', 'hs'],
            \'passive_filetypes': ['h', 'c', 'cpp'] }
let g:syntastic_filetype_map = { 'latex': 'tex',
            \ 'gentoo-metadata': 'xml' }
let g:syntastic_disabled_filetypes = ['c', 'cpp']

"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_lint_write = 1
"===============================FIX SLOW SCROLL================================
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
"==============================SOLORIZED THEME UP==============================
syntax enable
if !has('gui_running')
    set t_Co=256
    let g:Powerline_symbols = 'fancy'
endif
set background=dark
let g:solarized_visibility = "normal"
let g:solarized_contrast   = "normal"
let g:solarized_hitrail    = 1
let g:solarized_termtrans  = 0
let g:solarized_degrade    = 0
colorscheme solarized
"============================STATUS BAR SETTINGS UP============================
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'filetype' ] ]
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
    return ' '
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

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
