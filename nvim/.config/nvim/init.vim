"--PLUGINS--"
call plug#begin ('~/.config/nvim/bundle')
" For writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

" Tpope
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Functionality
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'othree/xml.vim'
Plug 'sickill/vim-pasta'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'thinca/vim-localrc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomedunn/vim.fortran'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'soli/prolog-vim'
Plug 'luochen1990/rainbow'

" Aesthetics
Plug 'sheerun/vim-polyglot'
Plug 'noahfrederick/vim-noctu'
Plug 'vim-airline/vim-airline-themes'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'typescript': ['~/.yarn/bin/javascript-typescript-stdio']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'

let g:rainbow_active = 1

" Polyglot "
let g:jsx_ext_required=0

" Git gutter "
hi GitGutterAdd          ctermfg = green
hi GitGutterChange       ctermfg = green
hi GitGutterDelete       ctermfg = red
hi GitGutterChangeDelete ctermfg = red

" localrc
let g:localrc_filename = ".local.vimrc"

" CtrlP "
let g:ctrlp_extensions = ['quickfix', 'undo']
let g:ctrlp_custom_ignore = 'node_modules\|.git'

" NERDTree "
map <C-\> :NERDTreeToggle<CR>

" Airline "
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

let g:airline_theme = 'term'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" SuperTab "
let g:SuperTabCrMapping = 1
let g:SuperTabMappingTabLiteral = '<S-Tab>'
let g:SuperTabDefaultCompletionType = 'context'

" vim-easy-align "
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" tagbar "
nmap <C-f> :TagbarToggle<CR>

let g:ale_linters = {'markdown': ['redpen','vale','write-good','textlint']}
let g:ale_fortran_gcc_use_free_form = 0
let g:ale_linter_aliases = {'pandoc': ['markdown']}

" pandoc "
let g:pandoc#modules#disabled = ["folding"]

" Commentary "
autocmd FileType lua setlocal commentstring=--\ %s\ --

" Super tab "
let g:SuperTabClosePreviewOnPopupClose = 1

"--APPEARANCE--"
" Syntax
syntax on
set noshowmode
set background=dark
colo noctu

" Line number
set nu

"--FUNCTIONALITY--"

autocmd BufEnter * silent! lcd %:p:h

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete


" File browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S+'

" Fuzzy find
set path+=**
set wildmenu

" Split
set splitright

" Search
set ignorecase
set smartcase
highlight IncSearch cterm = bold ctermbg = none ctermfg = magenta

" Soft tabs and clever indentation
set expandtab
set softtabstop=4
set shiftwidth=4

set copyindent
set smartindent
set preserveindent

" Reads and writes to files automatically
set autoread
set autowrite

set scrolloff=7

set mouse=

" Markdown syntax
augroup pandoc_syntax
autocmd BufRead,BufNew *.md set filetype=markdown.pandoc
augroup END

"--KEYBINDS--"

" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

map <F10> :Goyo 100 <bar> :Limelight!! <bar> :SoftPencil <CR>

" Split navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Visual line
nnoremap j gj
nnoremap k gk

nnoremap gj j
nnoremap gk k

noremap <leader><CR> :noh<CR>


" Security "
" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Either append this to the end of your .vimrc, or install it as a plugin with
" a plugin manager like Tim Pope's Pathogen.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
"

" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif
