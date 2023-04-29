let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog  = '/usr/bin/python3'
if filereadable("/bin/zsh")
    set shell=/bin/zsh
elseif filereadable("/bin/bash")
    set shell=/bin/bash
endif

call plug#begin('~/.vim/plugged')
"""Vim-plug selfupdate
Plug 'junegunn/vim-plug'

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
Plug 'tpope/vim-dadbod'

""""""Vim-scripts repos
"""Sniplets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"""Ctags supports
" Plug 'ludovicchabant/vim-gutentags'

"""""Other repos
Plug 'mattn/webapi-vim'
""" Tests for most languages and test systems
" Plug 'janko/vim-test'
" Plug 'rcarriga/vim-ultest'

"""" Some slow and rarely needed plugins
"""Show marks
Plug 'kshenoy/vim-signature'
""" Show hex colors
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase', 'on': [ 'HexokinaseToggle', 'HexokinaseOn' ] }

"""Draw undo tree
Plug 'mbbill/undotree', { 'on': ['UndotreeToggle', 'UndotreeShow'] }
"""Status bar
Plug 'itchyny/lightline.vim'
"""Ack supports
Plug 'mileszs/ack.vim', { 'on': ['LAck', 'Ack'] }

"""""Color themes
Plug 'morhetz/gruvbox'

""" Docs on Shift-K 
Plug 'thinca/vim-ref'
"""Seacher
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP']}
"""Align
Plug 'junegunn/vim-easy-align', { 'on': ['EasyAlign', '<Plug>(EasyAlign)'] }
""" Start page with sessions, last files and others
Plug 'mhinz/vim-startify'
Plug 'troydm/easybuffer.vim', { 'on': ['EasyBuffer', 'EasyBufferHorizontal', 'EasyBufferVertical'] }

Plug 'mattn/gist-vim'

"""""" For Golang
Plug 'fatih/vim-go', { 'for': 'go',
                     \ 'do': ':GoUpdateBinaries',
                     \ 'on': ['GoUpdateBinaries'] }

""" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

""" Asynchronous Language Server Protocol
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'


""" Multilanguage debugger
Plug 'puremourning/vimspector'

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

"" Show unprintable symbols with set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set showmatch " Show matching brackets.

set autoindent

"" Show command in bottom bar
set showcmd 
" перенос по словам, а не по буквам
set linebreak
set dy=lastline
"" Show line number
set number
"" Wrap lines by 200 char 
set wrap
set textwidth=200
set colorcolumn=200

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
set wildoptions=fuzzy

" let g:erlang_folding=1
" let	g:erlangHighlightBif=1 
" let g:erlangCompletionDisplayDoc = 0
" let g:erlangCompletitionGrep = 'ag'
" let g:erlangFoldSplitFunction=1
" let g:erlangHighlightErrors=0

" let g:erlang_tags_ignore=['.git', '.svn', '.eunit', 'release']
" let g:alchemist_tag_disable = 1
let g:vimspector_enable_mappings = 'HUMAN'

if version >= 700
    set history=256
    set undolevels=128
    if has('nvim')
        set undodir=~/.config/nvim/undodir/
    else
        set undodir=~/.vim/undodir/
    endif
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

""Backup
set backup
" set with '^=' prepends the directory name to the head of the list (check for exists)
" the '//' at the end of the directory name tells vim to use absolute path
set backupdir^=/tmp//,/var/tmp//
set directory^=/tmp//,/var/tmp//
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
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

let g:user_emmet_install_global = 0

" au FileType html,css,django EmmetInstall
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
" set foldmethod=expr
"   \ foldexpr=lsp#ui#vim#folding#foldexpr()
"   \ foldtext=lsp#ui#vim#folding#foldtext()
" set foldlevel=3
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


" call deoplete#custom#option("min_pattern_length", 2)
" call deoplete#custom#option('auto_complete_delay', 50)
" call deoplete#custom#option('smart_case', v:true)
" call deoplete#custom#option('omni_patterns', {
"             \  'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
"             \  'xhtml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
"             \  'xml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
"             \  'c' : ['->', '.'],
"             \  'go': '[^. *\t]\.\w*',
"             \  'objc' : ['->', '.'],
"             \  'ocaml' : ['.', '#'],
"             \  'cpp,objcpp' : ['->', '.', '::'],
"             \  'perl' : ['->'],
"             \  'php' : ['->', '::'],
"             \  'cs,java,javascript,d,python,perl6,scala,vb,elixir' : ['.'],
"             \  'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
"             \  'ruby' : ['.', '::'],
"             \  'lua' : ['.', ':'],
"             \  'erlang' : [':', '.', 're!#^\{'],
"             \  'elixir' : [':', '.', 're!#^\{']
"             \})
" let g:deoplete#sources#sort_class = ['ale', 'func', 'type', 'var', 'const']
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" let g:deoplete#sources#go#gocode_binary = '$HOME/bin/gocode'
" let g:deoplete#sources#go#source_importer = 1
" let g:deoplete#sources#go#builtin_objects = 1
" let g:deoplete#sources#go#unimported_packages = 1
" " call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
" " call deoplete#custom#var('clangx', 'default_c_options', '-Wall -std=c11')

" autocmd InsertEnter * ++once call deoplete#enable()
autocmd InsertEnter go ++once call plug#load('vim-go')
" " autocmd InsertEnter * ++once call plug#load('ultisnips')
" " autocmd InsertEnter * ++once call plug#load('vim-snippets')
" autocmd InsertEnter * ++once call plug#load('ale')

let g:ale_keep_list_window_open = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0

let g:ale_lint_on_save = 1
let g:ale_completion_enabled = 0

let g:ale_linters = {
            \ 'go': ['golangci-lint'],
            \ 'zsh': ['shellcheck'],
            \ 'sh': ['shellcheck'],
            \ 'bash': ['shellcheck'],
            \ 'python': [],
            \}


let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '
            \ --disable-all
            \ --exclude-use-default
            \ --tests=false
            \ --enable=deadcode
            \ --enable=goconst
            \ --enable=gocritic
            \ --enable=gocyclo
            \ --enable=gofmt
            \ --enable=goimports
            \ --enable=gosec
            \ --enable=gosimple
            \ --enable=govet
            \ --enable=ineffassign
            \ --enable=interfacer
            \ --enable=lll
            \ --enable=misspell
            \ --enable=nakedret
            \ --enable=scopelint
            \ --enable=staticcheck
            \ --enable=structcheck
            \ --enable=stylecheck
            \ --enable=typecheck
            \ --enable=unconvert
            \ --enable=unparam
            \ --enable=unused
            \ --enable=varcheck
            \ --enable=dupl
            \ --enable=golint
            \ --enable=errcheck
            \ --enable=errorlint
            \ --enable=revive
            \ --enable=exportloopref'

let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1

let g:go_code_completion_enabled = 0
let g:go_auto_type_info = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_gopls_enabled = 0
let g:go_gopls_deep_completion = 0
let g:go_fold_enable = ['import', 'varconst', 'package_comment']
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0
let g:go_def_mapping_enabled = 0

let g:snippets_dir = '~/.vim/plugged/vim-snippets/UltiSnips'
let g:snips_author = 'platinumthinker'
let g:my_email_addr = 'platinumthinker@gmail.com'

" let g:ref_erlang_man_dir = "/usr/lib/erlang/man/"
" let g:ref_erlang_cmd = "/usr/lib/erlang/bin/erl"
let g:startify_list_order = ['sessions', 'dir', 'files', 'bookmarks']
"" Don't change dir for openning new file from start screen
let g:startify_change_to_dir = 0
let g:startify_custom_header = [
            \ '                                 ________  __ __        ',
            \ '            __                  /\_____  \/\ \\ \       ',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            \ ]
"=====================================TESTS====================================
let g:ultest_pass_sign = '✅'
let g:ultest_fail_sign = '🔥'
let g:ultest_running_sign = '🔄'
let g:ultest_not_run_sign = '🪧'
" augroup UltestRunner
"     au!
"     au BufWritePost * UltestNearest
" augroup END
nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)
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
"================================ UUID ========================================
nnoremap <silent><leader>ig "=system('python -c "import uuid; print(uuid.uuid4(), end=\"\");"')<CR>P
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

nmap <C-p> :CtrlP<CR>

nmap <leader>g :LAck <cword><CR>

nnoremap <silent> <F4> :lclose<CR>

nmap <leader>b :EasyBuffer<CR>
vmap <Enter> <Plug>(EasyAlign)
inoremap <leader>fn <C-R>=expand("%:t:r")<CR>
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
""Edit vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
""Load vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>j :%!python -m json.tool<CR>

autocmd FileType go nnoremap <leader>n :GoReferrers<CR>

"" Open test file
autocmd FileType go nnoremap gt :e %:r_test.go<CR>

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

function! GoToGolangTest()
    let test_file = %:p
endfunction

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support in LSP side, using ALE instead
" map <silent> <leader> t :call GoToGolangTest()<CR>
"================================COLOR THEME UP================================
set termguicolors
syntax enable
" if !has('gui_running')
"     set t_Co=256
"     let g:solarized_termcolors = 256
" endif
" let g:solarized_termcolors = 16
" let g:solarized_contrast = 'hight'
" let g:solarized_visibility = 'high'
" let g:solarized_underline = 1
" let g:solarized_hitrail    = 1
" let g:solarized_termtrans  = 0
" let g:solarized_degrade    = 0
" colorscheme solarized
set background=light
if !has('gui_running')
     set t_Co=256
     let g:gruvbox_italic = 1
endif
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
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
                \ 'colorscheme': 'gruvbox',
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

" function! BCloseCb(channel, exit_status)
"     if a:exit_status == 0
"         call RunBackgroundCommand()
"     endif
" endfunction

function! RunBackgroundCommand()
    let l:color_file = $HOME . '/.color'
    let l:color = readfile(l:color_file, 1)[0]
    if l:color == 'light'
        set background=light
    else
        set background=dark
    endif
"     " call gruvbox#hls_toggle()
"     let l:command = 'inotifywait -e close_write ' . l:color_file
"     " " Launch the job.
"     " " Notice that we're only capturing out, and not err here. This is because, for some reason, the callback
"     " " will not actually get hit if we write err out to the same file. Not sure if I'm doing this wrong or?
"     if has('nvim')
"         call jobstart(l:command, {'exit_cb': 'BCloseCb', "in_io": "null", "out_io": "null", "err_io": "null"})
"     else
"         call job_start(l:command, {'exit_cb': 'BCloseCb', "in_io": "null", "out_io": "null", "err_io": "null"})
"     endif
endfunction

if has("unix")
  let s:uname = system("uname")
  if s:uname != "Darwin\n" && has('job')
      call RunBackgroundCommand()
  endif
endif


setlocal signcolumn=no

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

if executable('gopls')
    augroup lsp_gopls
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'gopls',
                    \ 'cmd': {server_info->['gopls']},
                    \ 'allowlist': ['go'],
                    \ })
        autocmd BufWritePre *.go LspDocumentFormatSync
        autocmd FileType go setlocal omnifunc=lsp#complete
        autocmd FileType go nnoremap <silent> gd :LspDefinition<CR>
        autocmd FileType go nnoremap <silent> gr :LspReferences<CR>
        autocmd FileType go nnoremap K :LspHover<CR>
    augroup end
endif

if executable('jedi-language-server')
    augroup lsp_jedi
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'jedi-language-server',
                    \ 'cmd': {server_info->['jedi-language-server']},
                    \ 'allowlist': ['python'],
                    \ })
        autocmd FileType python setlocal omnifunc=lsp#complete
        autocmd FileType python nnoremap <silent> gd :LspDefinition<CR>
        autocmd FileType python nnoremap <silent> gr :LspReferences<CR>
        autocmd FileType python nnoremap K :LspHover<CR>
    augroup end
endif

" https://github.com/erlang-ls/erlang_ls.git
if executable('erlang_ls')
    augroup lsp_erlang_ls
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'erlang-language-server',
                    \ 'cmd': {server_info->['erlang_ls']},
                    \ 'allowlist': ['erlang'],
                    \ })
        autocmd FileType erlang setlocal omnifunc=lsp#complete
        autocmd FileType erlang nnoremap <silent> gd :LspDefinition<CR>
        autocmd FileType erlang nnoremap <silent> gr :LspReferences<CR>
        autocmd FileType erlang nnoremap K :LspHover<CR>
    augroup end
endif

if executable('clojure-lsp')
    augroup lsp_clojure_lsp
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clojure-language-server',
                    \ 'cmd': {server_info->['clojure-lsp']},
                    \ 'allowlist': ['clojure'],
                    \ })
        autocmd FileType clojure setlocal omnifunc=lsp#complete
        autocmd FileType clojure nnoremap <silent> gd :LspDefinition<CR>
        autocmd FileType clojure nnoremap <silent> gr :LspReferences<CR>
        autocmd FileType clojure nnoremap K :LspHover<CR>
    augroup end
endif

" let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']
