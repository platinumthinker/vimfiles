call plug#begin('~/.vim/plugged')
"""Vundle selfupdate
Plug 'junegunn/vim-plug'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim', { 'do': 'pip3 install --upgrade neovim' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

""""""Tpope repos
"""Comment supports
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
"""Git supports
Plug 'tpope/vim-fugitive'
"""Date inc/dec (Alt-a/Alt-x)
Plug 'tpope/vim-speeddating'
"""Surround parenthese, brackets, quotes, XML tags and more
Plug 'tpope/vim-surround'
"""Mapping simply short normal mode aliases
Plug 'tpope/vim-unimpaired'
"""Repeat for surround, speeddating, abolish, unimpaired, commentary
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar', { 'on': 'ToggleVExplorer' }

""""""Vim-scripts repos
"""Sniplets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"""Ctags supports
Plug 'ludovicchabant/vim-gutentags'
"""Ascii art
Plug 'vim-scripts/DrawIt'
"""Show marks
Plug 'kshenoy/vim-signature'

"""""Other repos
Plug 'mattn/webapi-vim'

"""Draw undo tree
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle', 'UndotreeShow'] }
"""Status bar
Plug 'itchyny/lightline.vim'
"""Color themes
Plug 'altercation/vim-colors-solarized'
"""Ack supports
Plug 'mileszs/ack.vim', { 'on': ['LAck', 'Ack'] }

""" Docs on Shift-K 
Plug 'thinca/vim-ref'
"""Seacher
Plug 'kien/ctrlp.vim'
"""Align
Plug 'junegunn/vim-easy-align', { 'on': ['EasyAlign', '<Plug>(EasyAlign)'] }
""" Start page with sessions, last files and others
Plug 'mhinz/vim-startify'
Plug 'troydm/easybuffer.vim', { 'on': ['EasyBuffer', 'EasyBufferHorizontal', 'EasyBufferVertical'] }

"""""" For erlang
""" Vim erlang collects
"""Erlang motions
" Plug 'ten0s/syntaxerl', { 'for': 'erlang' }
Plug 'platinumthinker/vim-erlang-runtime', { 'for': 'erlang' }
" Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
Plug 'platinumthinker/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags', { 'for': 'erlang' }

" Plug 'elixir-lang/vim-elixir',  { 'for': 'elixir' }
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Plug 'ElmCast/elm-vim', { 'for': 'elm' }


"""""" For python
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

"""""" For html/css
" Plug 'mattn/emmet-vim'
""" Syntax for DTL
" Plug 'vim-scripts/django.vim', { 'for': 'django' }

Plug 'mattn/gist-vim'

"""""" For Golang
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'deoplete-plugins/deoplete-go', { 'for': 'go', 'do': 'make'}
" Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

""" Need to disable others indent/syntax plugins
Plug 'sheerun/vim-polyglot'
""" Asynchronous Lint Engine
Plug 'dense-analysis/ale'



" Add plugins to &runtimepath
call plug#end()

"==================================VIM CONFIG==================================
if filereadable("/bin/zsh")
    set shell=/bin/zsh
elseif filereadable("/bin/bash")
    set shell=/bin/bash
endif

set helplang=en
set title
set cursorline
set cursorcolumn
" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250 
set smartcase
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
set wildignore+=.git,.svn
set wildignore-=deps

" let g:erlang_folding=1
" let	g:erlangHighlightBif=1 
" let g:erlangCompletionDisplayDoc = 0
" let g:erlangCompletitionGrep = 'ag'
" let g:erlangFoldSplitFunction=1
" let g:erlangHighlightErrors=0

" let g:erlang_tags_ignore=['.git', '.svn', '.eunit', 'release']
" let g:alchemist_tag_disable = 1

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

" Required for operations modifying multiple buffers like rename.
set hidden

let g:user_emmet_mode='a'

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

let g:gutentags_exclude_project_root = [ '/usr/local', '/usr/lib' ]

setlocal spell spelllang=en_us,ru_yo

""Add russian keyboard for commands
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

let g:user_emmet_install_global = 0

au FileType html,css,django EmmetInstall
" DTL for erlydtl
au BufRead,BufNewFile *.{dtl,tmpl} set filetype=django
au BufRead,BufNewFile *{relx,rebar,sys}.config* set filetype=erlang
au BufRead,BufNewFile *.{appup,app} set filetype=erlang
au BufRead,BufNewFile *.{config,appup.src,app.src} set filetype=erlang
" Open file in last place
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g'\"" | endif

"Folds
set foldmethod=syntax
let g:markdown_fold_style = 'nested'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0

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


let g:ackprg = 'ag --nogroup --nocolor --column --ignore tags --ignore-dir "release" -U'
let g:ackhighlight = 1

call deoplete#custom#option('auto_complete_delay', 20)
call deoplete#custom#option('smart_case', v:true)
call deoplete#custom#option('omni_patterns', {
            \  'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
            \  'xhtml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
            \  'xml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
            \  'c' : ['->', '.'],
            \  'objc' : ['->', '.'],
            \  'ocaml' : ['.', '#'],
            \  'cpp,objcpp' : ['->', '.', '::'],
            \  'perl' : ['->'],
            \  'php' : ['->', '::'],
            \  'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \  'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
            \  'ruby' : ['.', '::'],
            \  'lua' : ['.', ':'],
            \  'erlang' : [':', '.', 're!#^\{'],
            \  'elixir' : [':', '.', 're!#^\{'],
            \  'go' : ['.'],
            \})

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
" Set this if you want to.
" " This can be useful if you are combining ALE with
" " some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1

let g:ale_lint_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {
            \ 'go': ['gobuild', 'govet', 'gofmt', 'golint'],
            \ 'zsh': ['shell', 'shellcheck'],
            \ 'sh': ['shell', 'shellcheck'],
            \ 'bash': ['shell', 'shellcheck'],
            \   'erlang': ['syntaxerl'],
            \}
  " \   'elixir': ['credo', 'dialyxir', 'dogma'],
  " \   'go': ['gofmt', 'golint', 'go vet'],
  " \   'hack': ['hack'],
  " \   'help': [],
  " \   'perl': ['perlcritic'],
  " \   'perl6': [],
  " \   'python': ['flake8', 'mypy', 'pylint'],
  " \   'rust': ['cargo'],
  " \   'spec': [],
  " \   'text': [],
  " \   'vue': ['eslint', 'vls'],
  " \   'zsh': ['shell'],


let g:go_code_completion_enabled = 0
let g:go_snippet_engine = "ultisnips"

let g:snippets_dir = '~/.vim/plugged/vim-snippets/UltiSnips'
let g:snips_author = 'platinumthinker'
let g:my_email_addr = 'platinumthinker@gmail.com'

" let g:ref_erlang_man_dir = "/usr/lib/erlang/man/"
" let g:ref_erlang_cmd = "/usr/lib/erlang/bin/erl"
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
" autocmd FileType c,cpp,java,erlang,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
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
""Save session (load: vim -S)
nnoremap <leader>s :mksession<CR>
nnoremap <leader>sp :ErlangSpec<CR>
""Load vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
""Save session (load: vim -S)
nnoremap <leader>s :mksession<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>j :%!python -m json.tool<CR>

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

"" system clipboard
vnoremap <C-c> y: call system("xclip -i", getreg("\""))<CR>
noremap <C-V> :r !xclip -o <CR>
"===============================FIX SLOW SCROLL================================
set synmaxcol=128
syntax sync minlines=256
"================================COLOR THEME UP================================
syntax enable
if !has('gui_running')
    set t_Co=256
    let g:solarized_termcolors = 256
endif
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
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rebar|eunit)$',
    \ 'file': '\v\.(beam|exe|so|dll|dump|core|class|o)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
    \ }
let g:Powerline_symbols = 'fancy'
"============================STATUS BAR SETTINGS UP============================
set laststatus=2

if $SSH_CONNECTION
    let g:lightline = {
                \ 'colorscheme': 'default',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
                \   'right': [ [ 'lineinfo' ], ['percent'], [ 'filetype' ] ]
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
                \ }
else
    let g:lightline = {
                \ 'colorscheme': 'solarized',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
                \   'right': [ [ 'lineinfo' ], ['percent'], [ 'filetype' ] ]
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
  if expand('%:t') =~ '^ControlP$'
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

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

function! BCloseCb(channel, exit_status)
    if a:exit_status == 0
        call RunBackgroundCommand()
    endif
endfunction

function! RunBackgroundCommand()
    let l:color_file = $HOME . '/.color'
    let l:color = readfile(l:color_file, 1)[0]
    if l:color == 'light'
        set background=light
    else
        set background=dark
    endif
    let l:command = 'inotifywait -e close_write ' . l:color_file
    " " Launch the job.
    " " Notice that we're only capturing out, and not err here. This is because, for some reason, the callback
    " " will not actually get hit if we write err out to the same file. Not sure if I'm doing this wrong or?
    call job_start(l:command, {'exit_cb': 'BCloseCb', "in_io": "null", "out_io": "null", "err_io": "null"})
endfunction

if has("unix")
  let s:uname = system("uname")
  if s:uname != "Darwin\n"
      call RunBackgroundCommand()
  endif
endif
