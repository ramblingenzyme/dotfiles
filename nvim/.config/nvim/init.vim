"--PLUGINS--"
call plug#begin ('~/.config/nvim/bundle')
" For writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Tpope
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Functionality
Plug 'w0rp/ale'
Plug 'sickill/vim-pasta'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'thinca/vim-localrc'
" Plug 'benekastah/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'

" Aesthetics
Plug 'sheerun/vim-polyglot'
Plug 'noahfrederick/vim-noctu'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

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

" SuperTab "
let g:SuperTabCrMapping = 1
let g:SuperTabMappingTabLiteral = '<S-Tab>'
let g:SuperTabDefaultCompletionType = 'context'

" vim-easy-align "
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" tagbar "
nmap <C-f> :TagbarToggle<CR>

" neomake "
" let g:neomake_cpp_enable_marks=['gcc']
" let g:neomake_cpp_gcc_args = ["-std=c++11", "-pedantic", "-Wall"]

" autocmd BufWinEnter,BufWritePost *.cpp,*.c,*.cc,*.h,*.hpp Neomake gcc
" autocmd BufWinEnter,BufWritePost *.js,*.jsx Neomake eslint
" set complete+=t

" Commentary "
autocmd FileType lua setlocal commentstring=--\ %s\ --

"--APPEARANCE--"
" Syntax
syntax on
set noshowmode
set background=dark
colo noctu

" Line number
set nu

"--FUNCTIONALITY--"
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
set splitbelow
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
autocmd BufRead,BufNew *.md set filetype=markdown

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
