vim.cmd([[
    let g:python_host_prog  = '/usr/bin/python2'
    let g:python3_host_prog  = '/usr/bin/python3'
    set shell=/bin/zsh
]])

vim.fn.has('nvim-0.7')

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('Shougo/deoplete.nvim', {['do'] = vim.fn[':UpdateRemotePlugins']})
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug 'Shougo/echodoc.vim'

------ Tpope repos
--- Comment supports
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
--- Git supports
Plug 'tpope/vim-fugitive'
--- Date inc/dec (Alt-a/Alt-x)
Plug 'tpope/vim-speeddating'
--- Surround parenthese, brackets, quotes, XML tags and more
Plug 'tpope/vim-surround'
--- Mapping simply short normal mode aliases
Plug 'tpope/vim-unimpaired'
--- Repeat for surround, speeddating, abolish, unimpaired, commentary
Plug 'tpope/vim-repeat'
-- Plug('tpope/vim-vinegar', {['on'] = vim.fn['ToggleVExplorer']})
Plug 'tpope/vim-vinegar'
--- End some special construction for programming staff (like if-end)
Plug 'tpope/vim-endwise'

------ Vim-scripts repos
--- Sniplets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
--- Ctags supports
Plug 'ludovicchabant/vim-gutentags'
-- --- Ascii art
-- Plug 'vim-scripts/DrawIt'
--- Show marks
Plug 'kshenoy/vim-signature'

---- Other repos
Plug 'mattn/webapi-vim'
-- --- Tests for most languages and test systems
-- Plug 'janko/vim-test'
-- Plug 'rcarriga/vim-ultest'

--- Draw undo tree
Plug 'mbbill/undotree'
-- Plug('mbbill/undotree', {
    -- ['on'] = function()
    --     vim.call('UndotreeToggle')
    --     vim.call('UndotreeShow')
    -- end
-- })

--- Status bar
Plug 'itchyny/lightline.vim'
--- Ack supports
Plug 'mileszs/ack.vim'
-- Plug('mileszs/ack.vim', {
--     ['on'] = function()
--         vim.call('LAck')
--         vim.call('Ack')
--     end
-- })

---- Color themes
Plug 'morhetz/gruvbox'

--- Docs on Shift-K 
Plug 'thinca/vim-ref'
--- Seacher
Plug 'kien/ctrlp.vim'
-- Plug('kien/ctrlp.vim', {['on'] = vim.fn['CtrlP']})
--- Align
Plug 'junegunn/vim-easy-align'
-- Plug('junegunn/vim-easy-align', {
--     ['on'] = function()
--         vim.call('EasyAlign')
--         vim.call('<Plug>(EasyAlign)')
--     end
-- })

--- Start page with sessions, last files and others
Plug 'mhinz/vim-startify'
Plug 'troydm/easybuffer.vim'
-- Plug('troydm/easybuffer.vim', {
--     ['on'] = function()
--         vim.call('EasyBuffer')
--         vim.call('EasyBufferHorizontal')
--         vim.call('EasyBufferVertical')
--     end
-- })


vim.call('plug#end')

-- set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
--- General vim config
vim.cmd([[
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

    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set foldlevel=3
    let g:markdown_fold_style = 'nested'
    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
    let g:markdown_syntax_conceal = 0
    " let g:erlang_folding=1
    " let	g:erlangHighlightBif=1 
    " let g:erlangCompletionDisplayDoc = 0
    " let g:erlangCompletitionGrep = 'ag'
    " let g:erlangFoldSplitFunction=1
    " let g:erlangHighlightErrors=0

    " let g:erlang_tags_ignore=['.git', '.svn', '.eunit', 'release']
    " let g:alchemist_tag_disable = 1

    set history=256
    set undolevels=128
    set undodir=~/.config/nvim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000

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

    " au FileType html,css,django EmmetInstall
    " DTL for erlydtl
    au BufRead,BufNewFile *.{dtl,tmpl} set filetype=django
    au BufRead,BufNewFile *{relx,rebar,sys}.config* set filetype=erlang
    au BufRead,BufNewFile *.{appup,app} set filetype=erlang
    au BufRead,BufNewFile *.{config,appup.src,app.src} set filetype=erlang
]])
-- Open file in last place
--- au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
---             \| exe "normal! g'\"" | endif


vim.cmd([[
    let g:deoplete#enable_at_startup = 1

    let g:ackprg = 'ag --nogroup --nocolor --column --ignore tags --ignore-dir "release" -U'
    let g:ackhighlight = 1
    let g:deoplete#sources#sort_class = ['ale', 'func', 'type', 'var', 'const']
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

    " let g:deoplete#sources#go#gocode_binary = '$HOME/bin/gocode'
    let g:deoplete#sources#go#source_importer = 1
    let g:deoplete#sources#go#builtin_objects = 1
    let g:deoplete#sources#go#unimported_packages = 1

    let g:ale_keep_list_window_open = 0
    let g:ale_set_quickfix = 1
    let g:ale_open_list = 0

    let g:ale_lint_on_save = 1
    let g:ale_completion_enabled = 0

    let g:ale_c_parse_makefile = 1
    let g:ale_c_parse_compile_commands = 1

    let g:go_auto_type_info = 1
    let g:go_doc_keywordprg_enabled = 1
    let g:go_snippet_engine = "ultisnips"
    let g:go_fmt_command = "goimports"
    " let g:go_code_completion_enabled = 0
    " let g:go_gopls_complete_unimported = 1
    " let g:go_gopls_enabled = 1
    " let g:go_gopls_deep_completion = 1
    " let g:go_gopls_local = "local"
    " let g:go_list_type = ""
    let g:go_fold_enable = ['import', 'varconst', 'package_comment']
    let g:go_highlight_array_whitespace_error = 1
    let g:go_highlight_string_spellcheck = 1
    let g:go_highlight_format_strings = 1
    let g:go_highlight_diagnostic_errors = 0
    let g:go_highlight_diagnostic_warnings = 0

    let g:snippets_dir = '~/.vim/plugged/vim-snippets/UltiSnips'
    let g:snips_author = 'platinumthinker'
    let g:my_email_addr = 'platinumthinker@gmail.com'

    " let g:ref_erlang_man_dir = "/usr/lib/erlang/man/"
    " let g:ref_erlang_cmd = "/usr/lib/erlang/bin/erl"
    let g:startify_list_order = ['sessions', 'dir', 'files', 'bookmarks']
    "" Don't change dir for openning new file from start screen
    let g:startify_change_to_dir = 0

    let g:gist_detect_filetype = 1
    let g:gist_show_privates = 1

    syntax enable
    set background=light
    let g:gruvbox_contrast_light = 'hard'
    colorscheme gruvbox

    let g:ctrlp_max_files = 10000
    let g:ctrlp_max_depth = 10
    let g:ctrlp_working_path_mode = 'rw'
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rebar|eunit)$',
        \ 'file': '\v\.(beam|exe|so|dll|dump|core|class|o)$',
        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
        \ }
    let g:Powerline_symbols = 'fancy'
]])


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "lua", "go", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
}

vim.cmd([[
	inoremap jj <ESC>

	"" Open/close folds
	nnoremap <Space> za 

	nmap <C-p> :CtrlP<CR>

	nmap <leader>g :LAck <cword><CR>

	nnoremap <silent> <F4> :lclose<CR>

	nnoremap <silent><F8> :TagbarToggle<CR>
	inoremap <silent><F8> :TagbarToggle<CR>

	"" call togglebg#map("<F5>")
	nmap <leader>b :EasyBuffer<CR>
	nmap <leader>bh :EasyBufferHorizontal<CR>
	nmap <leader>bv :EasyBufferVertical<CR>
	nmap <leader>m :MerginalToogle<CR>
	nmap <leader>t :ErlangTags<CR>
	nnoremap <leader>sp :ErlangSpec<CR>

	vmap <Enter> <Plug>(EasyAlign)
	inoremap \fn <C-R>=expand("%:t:r")<CR>

	nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
	"" Edit vimrc
	nnoremap <leader>ev :vsp $MYVIMRC<CR>
	"" Save session (load: vim -S)
	nnoremap <leader>s :mksession<CR>
	nnoremap <leader>sp :ErlangSpec<CR>
	"" Load vimrc
	nnoremap <leader>sv :source $MYVIMRC<CR>
	"" Save session (load: vim -S)
	nnoremap <leader>s :mksession<CR>

	nnoremap <leader>u :UndotreeToggle<CR>
	nnoremap <leader>j :%!python -m json.tool<CR>
]])
