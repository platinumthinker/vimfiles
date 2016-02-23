"====================================VUNDLE====================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"=================================VUNDLE REPO==================================
"""Vundle selfupdate
Bundle 'gmarik/vundle'


Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

""""""Tpope repos
"""Comment supports
Bundle 'tpope/vim-commentary'
"""Git supports
Bundle 'tpope/vim-fugitive'
Bundle 'idanarye/vim-merginal'
"""Surround parenthese, brackets, quotes, XML tags and more
Bundle 'tpope/vim-surround'
"""Mapping simply short normal mode aliases
Bundle 'tpope/vim-unimpaired'
"""Repeat for surround, speeddating, abolish, unimpaired, commentary
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-vinegar'

""""""Vim-scripts repos
"""LaTeX
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'LaTeX-Box'
"""Ctags supports
Bundle 'ctags.vim'
"""Ascii art
Bundle 'DrawIt'
"""Bats syntax highlight
Bundle 'bats.vim'

""""""Other repos
"""Draw undo tree
Bundle 'mbbill/undotree'
"""Easy change buffers
Bundle 'troydm/easybuffer.vim'
"""Super syntax
Bundle 'scrooloose/syntastic'
"""Status bar
Bundle 'itchyny/lightline.vim'
Plugin 'Wildog/airline-weather.vim'

"""Snippets engine
Bundle 'msanders/snipmate.vim'
"""Snippets repo
Bundle 'honza/vim-snippets'
"""Google calendar
Bundle 'itchyny/calendar.vim'
"""Color themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'jonathanfilip/vim-lucius'
"""Ack supports
Bundle 'mileszs/ack.vim'
"""Bar of function in open file (from ctags)
Bundle 'majutsushi/tagbar'
"""Searcher
Bundle 'kien/ctrlp.vim'
"""Align
Bundle 'junegunn/vim-easy-align'
"""Doc
Bundle 'thinca/vim-ref'

""""""For erlang
""" Vim erlang collects
Bundle 'vim-erlang/vim-erlang-runtime'
Bundle 'vim-erlang/vim-erlang-compiler'
Bundle 'vim-erlang/vim-erlang-omnicomplete'
Bundle 'vim-erlang/vim-erlang-tags'
Bundle 'akalyaev/vim-erlang-spec'
"""For rebar
Bundle 'fishcakez/vim-rebar'
Bundle 'tpope/vim-dispatch'
"""Erlang motions
Bundle 'edkolev/erlang-motions.vim'

"""" For readmine
Bundle 'toritori0318/vim-redmine'
Bundle 'mattn/webapi-vim'

""" Start page with sessions, last files and others
Bundle 'mhinz/vim-startify'

""" Rfc
Bundle 'mhinz/vim-rfc'
Bundle 'rfc-syntax', { 'for': 'rfc' }
"==================================VIM CONFIG==================================
set shell=/bin/zsh
filetype plugin indent on

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

"" Show command in bottom bar
set showcmd 
" перенос по словам, а не по буквам
set linebreak
set dy=lastline
"" Show line number
set number
set nu
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

set completeopt=menu,menuone,longest
set pumheight=15

set wildmode=list:longest,full
set wildmenu 
set wildignore+=.git,.svn,_build,release,.eunit

let g:erlang_folding=1
"let g:erlangRefactoring=1
"let erlang_show_errors=0
let	g:erlangHighlightBif=1 
let g:erlangCompletionDisplayDoc = 0
let g:erlangCompletitionGrep = 'ag'
let g:erlangFoldSplitFunction=1
let g:erlangManPath="/home/thinker/erlware/man"
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

""Set varible from my envirmoment
" let &path = &path . "," . getcwd()
" let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')

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

let g:weather#area = 'novosibirs,ru'
let g:weather#unit = 'metric'
let g:weather#appid = '8f424690e52df0c37cc628114d66b688'
let g:weather#format = '%s %.0f'
let g:weather#status_map = {
            \ "01": "☀",
            \ "02": "☁",
            \ "03": "☁",
            \ "04": "☁",
            \ "09": "☂",
            \ "10": "☔",
            \ "11": "☇",
            \ "13": "❄",
            \ "50": "≡",
            \}

let g:weather#cache_file = '~/.cache/.weather'
let g:weather#cache_ttl = '3600'

""Spelli cheker
setlocal spell spelllang=en_us,ru_yo

""Add russian keyboard for commands
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan


if has("autocmd")
    "Markdown fix
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
    au BufRead,BufNewFile *.{tex} set filetype=tex

    au BufRead,BufNewFile *.{appup,app} set filetype=erlang
    au BufRead,BufNewFile *{relx,rebar,sys}.config* set filetype=erlang

    " au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") \| exe "normal! g'\"" | endif


    " Open file in last place
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif

    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
    " au BufRead,BufNewFile *.{sh,bash} set iskeyword+=$
    au BufRead,BufNewFile *.{bats} set filetype=sh
endif

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

let g:tagbar_autofocus = 1

let g:ackprg = 'ag -U --nogroup --nocolor --column --ignore-dir "release" --ignore "TAGS" --ignore "tags"'
let g:ackhighlight = 1
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
" autocmd FileType erlang :ErlangTags
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
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

nnoremap <tab> <C-w><C-w>  
map <silent><BS> :NERDTreeToggle<CR>

nnoremap <tab> <C-w><C-w>  
nmap <leader>g :LAck <cword><CR>
nmap <leader>bh :EasyBufferHorizontal<CR>
nmap <leader>bv :EasyBufferVertical<CR>
nmap <leader>b :EasyBuffer<CR>
nmap <leader>m :MerginalToogle<CR>
nmap <leader>t :ErlangTags<CR>

nnoremap <silent> <F4> :lclose<CR>

nnoremap <silent><F8> :TagbarToggle<CR>

call togglebg#map("<F5>")

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

""Edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
""Load vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>u :UndotreeToggle<CR>
""Save session (load: vim -S)
nnoremap <leader>s :mksession<CR>

nnoremap <leader>sp :ErlangSpec<CR>

vmap <Enter> <Plug>(EasyAlign)

inoremap \fn <C-R>=expand("%:t:r")<CR>

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
let g:calendar_frame = 'default'
"==================================SYNTASTICS==================================
let g:syntastic_check_on_openn=0
let g:syntastic_check_on_wq=0
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_filetype_map = { 'latex': 'tex',
            \ 'xsd': 'xml',
            \ 'gentoo-metadata': 'xml' }
let g:syntastic_mode_map = { "mode": "active",
            \ "active_filetypes":  ["c", "cpp"],
            \ "passive_filetypes": ["erlang"] }
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_c_compiler_options = ' -std=c11 -I /usr/src/linux-headers-4.0.0-2-common/include/ '

"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_lint_write = 1
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
let g:pymode_rope_complete_on_dot = 1
let g:pymode_lint_write = 1
"===============================FIX SLOW SCROLL================================
" set lazyredraw
set synmaxcol=128
syntax sync minlines=256
"==============================SOLORIZED THEME UP==============================
syntax enable
if empty($VIM_LIGHT_COLOR)
    set background=dark
    if !has('gui_running')
        set t_Co=256
        let g:Powerline_symbols = 'fancy'
        let g:solarized_termcolors = 16
        let g:solarized_termtrans  = 0
        let g:solarized_degrade    = 0
    else
        let g:solarized_termcolors = 256
        let g:solarized_contrast = 'hight'
        let g:solarized_visibility = 'high'
    endif
    let g:solarized_underline = 1
    let g:solarized_hitrail    = 1
    colorscheme solarized
else
    colorscheme lucius
endif
"====================================CTRL_P====================================
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 8
let g:ctrlp_lazy_update = 1
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|_build|release|eunit)$',
    \ 'file': '\v\.(beam|exe|so|dll|dump|core)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
    \ }
"============================STATUS BAR SETTINGS UP============================
set laststatus=2

if $SSH_CONNECTION
    let g:lightline = {
                \ 'colorscheme': 'default',
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
                \ }
                \ }
else
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
endif

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
