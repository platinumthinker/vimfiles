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
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-dispatch'
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
Bundle 'tpope/vim-vinegar'

""""""Vim-scripts repos
"""Sniplets
Bundle 'SirVer/ultisnips'
"""Fast toggle commets
" Bundle 'The-NERD-Commenter'
"""Ctags supports
Bundle 'ctags.vim'
"""Ascii art
Bundle 'DrawIt'

""""""Other repos
Bundle 'mattn/webapi-vim'

"""Draw undo tree
Bundle 'mbbill/undotree'
"""Super syntax
Bundle 'scrooloose/syntastic'
"""Status bar
Bundle 'itchyny/lightline.vim'
"""Color themes
Bundle 'altercation/vim-colors-solarized'
"""Ack supports
Bundle 'mileszs/ack.vim'
"""Autocomplite
Bundle 'Valloric/YouCompleteMe'
"""Dublicate character (quotes, brackets, ets)
Bundle 'Raimondi/delimitMate'
Bundle 'thinca/vim-ref'
"""Seacher
Bundle 'kien/ctrlp.vim'
"""Erlang motions
Bundle 'edkolev/erlang-motions.vim'
"""Align
Bundle 'junegunn/vim-easy-align'
""" Start page with sessions, last files and others
Bundle 'mhinz/vim-startify'

""""""For erlang
""" Vim erlang collects
Bundle 'ten0s/syntaxerl'
" Bundle 'vim-erlang/vim-erlang-runtime'
Bundle 'vim-erlang/vim-erlang-compiler'
Bundle 'vim-erlang/vim-erlang-omnicomplete'
Bundle 'vim-erlang/vim-erlang-tags'
Bundle 'akalyaev/vim-erlang-spec'

""""""Fot html/css
Bundle 'mattn/emmet-vim'
""" Syntax for DTL
Bundle 'django.vim'

Bundle 'mattn/gist-vim'

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

set completeopt=longest,menuone
set pumheight=15

set wildmode=list:longest,full
set wildmenu 
set wildignore+=.git,.svn,_build

let g:erlang_folding=1
"let g:erlangRefactoring=1
"let erlang_show_errors=0
let	g:erlangHighlightBif=1 
let g:erlangCompletionDisplayDoc = 0
let g:erlangCompletitionGrep = 'ag'
let g:erlangFoldSplitFunction=1
"let g:erlangManPath="/home/thinker/erlware/man"
let g:erlangHighlightErrors=0

let g:erlang_tags_ignore=['.git', '.svn', '.eunit', 'release']

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

let g:user_emmet_mode='a'

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

let g:user_emmet_install_global = 0

"Markdown fix
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
au BufRead,BufNewFile *.{dtl,tmpl} set filetype=django
au FileType html,css,django EmmetInstall
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
" Open file in last place
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g'\"" | endif
au BufRead,BufNewFile *{relx,rebar,sys}.config* set filetype=erlang
au BufRead,BufNewFile *.{appup,app} set filetype=erlang
au BufRead,BufNewFile *.{appup.src,app.src} set filetype=erlang
au FileType erlang let g:ycm_cache_omnifunc = 0

"Folds
set foldmethod=syntax
let g:markdown_fold_style = 'nested'

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=4

let g:tagbar_autofocus = 1

""netrw default vertical split
let g:netrw_preview = 1
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" Recursed delete directory in netrw
let g:netrw_localrmdir='rm -r'
" absolute width of netrw window
let g:netrw_winsize = -23
" do not display info on the top of window
let g:netrw_banner = 0
" tree-view
let g:netrw_liststyle = 3



let g:ackprg = 'ag --nogroup --nocolor --column --ignore-dir "release"'
let g:ackhighlight = 1

let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_always_populate_location_list = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_use_ultisnips_completer = 1

let g:snippets_dir = '~/.vim/snippets/'
let g:snips_author = 'platinumthinker'
let g:my_email_addr = 'platinumthinker@gmail.com'

let g:ref_erlang_man_dir = "/usr/lib/erlang/man/"
let g:ref_erlang_cmd = "/usr/lib/erlang/bin/erl"
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
"" Don't change dir for openning new file from start screen
let g:startify_change_to_dir = 0
"=============================DELETE TRAILING SPACES===========================
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,erlang,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
"================================ Gist ========================================
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
"========================= Encode\Decode HTML =================================
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
    execute range . 'sno/&quot;/"/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
    execute range . 'sno/"/&quot;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
noremap <silent> \h :Entities 0<CR>
noremap <silent> \H :Entities 1<CR>
"================================KEY BINDINGS==================================
inoremap jj <ESC>
"Open/close folds
nnoremap <Space> za 

nmap <leader>g :LAck <cword><CR>

nnoremap <silent> <F4> :lclose<CR>

nnoremap <silent><F8> :TagbarToggle<CR>
inoremap <silent><F8> :TagbarToggle<CR>

call togglebg#map("<F5>")

nmap <leader>b :EasyBuffer<CR>
nmap <leader>bh :EasyBufferHorizontal<CR>
nmap <leader>bv :EasyBufferVertical<CR>
nmap <leader>m :MerginalToogle<CR>
nmap <leader>t :ErlangTags<CR>
nnoremap <leader>sp :ErlangSpec<CR>

vmap <Enter> <Plug>(EasyAlign)
inoremap \fn <C-R>=expand("%:t:r")<CR>

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

""Edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
""Load vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
""Save session (load: vim -S)
nnoremap <leader>s :mksession<CR>

nnoremap <leader>u :UndotreeToggle<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Toggle netrw like NERDTree
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

map <silent> - :call ToggleVExplorer()<CR>
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
map @@x !%xmllint --format --recover -^M
"==================================SYNTASTICS==================================
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_mode_map = { 'mode': 'active',
            \'active_filetypes': ['erl', 'hs'],
            \'passive_filetypes': ['h', 'c', 'cpp'] }
let g:syntastic_filetype_map = { 'latex': 'tex',
            \ 'gentoo-metadata': 'xml' }
let g:syntastic_disabled_filetypes = ['c', 'cpp']

let g:pymode_rope_complete_on_dot = 1
let g:pymode_lint_write = 1
"===============================FIX SLOW SCROLL================================
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
"==============================SOLORIZED THEME UP==============================
syntax enable
if !has('gui_running')
    set t_Co=256
    let g:solarized_termcolors = 256
endif
set background=dark
let g:solarized_termcolors = 16
let g:solarized_contrast = 'hight'
let g:solarized_visibility = 'high'
let g:solarized_underline = 1
let g:solarized_hitrail    = 1
let g:solarized_termtrans  = 0
let g:solarized_degrade    = 0
colorscheme solarized
"====================================CTRL_P====================================
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 10
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rebar|eunit)$',
    \ 'file': '\v\.(beam|exe|so|dll|dump|core)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
    \ }
let g:Powerline_symbols = 'fancy'
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
