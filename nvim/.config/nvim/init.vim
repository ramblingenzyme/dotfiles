"--APPEARANCE--"
" Syntax
syntax on
set noshowmode
set background=dark
colo base16-darktooth

" Line number
set nu
highlight SignColumn   ctermbg = black
highlight LineNr       ctermbg = black  ctermfg = green
highlight CursorLineNr ctermbg = black  ctermfg = green

" Cursor line
" set cursorline
highlight CursorLine ctermbg = green

"--FUNCTIONALITY--"
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

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

"--PLUGINS--"
call plug#begin ('~/.config/nvim/bundle')
Plug 'kassio/neoterm'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-session'
Plug 'junegunn/goyo.vim'
Plug 'ervandew/supertab'
Plug 'critiqjo/lldb.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'mrtazz/simplenote.vim'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'chriskempson/base16-vim'

call plug#end()

" Startify "
let g:startify_session_dir = '~/.config/nvim/sessions'

" Session "
let g:session_directory = '~/.config/nvim/sessions'
let g:session_autosave = 'no'

" Simplenote "
source ~/.simplenoterc

" Polyglot "
let g:jsx_ext_required=0

" Git gutter "
let g:gitgutter_override_sign_column_highlight = 0
hi GitGutterAdd          ctermbg = black  ctermfg = green
hi GitGutterChange       ctermbg = black  ctermfg = green
hi GitGutterDelete       ctermbg = black  ctermfg = red
hi GitGutterChangeDelete ctermbg = black  ctermfg = red

" CtrlP "
let g:ctrlp_extensions = ['quickfix', 'undo']
let g:ctrlp_custom_ignore = 'node_modules\|.git'

" NERDTree "
map <C-\> :NERDTreeToggle<CR>

" EasyMotion "
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionTarget2First ctermfg=yellow
hi EasyMotionTarget2Second ctermfg=yellow

hi EasyMotionMoveHL ctermfg=black

" Airline "
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

let g:airline_theme = 'base16color'
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
let g:neomake_cpp_enable_marks=['gcc']
let g:neomake_cpp_gcc_args = ["-std=c++11", "-pedantic", "-Wall"]
autocmd BufWinEnter,BufWritePost *.cpp,*.c,*.cc,*.h,*.hpp Neomake gcc
autocmd BufWinEnter,BufWritePost *.js,*.jsx Neomake eslint
set complete+=t

" Commentary "
autocmd FileType lua setlocal commentstring=--\ %s\ --

" misc "
set lazyredraw
set regexpengine=1

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
