"--APPEARANCE--"
" Syntax
syntax on
colo base16-darktooth
set background=dark
set noshowmode

" Line number
set nu
highlight SignColumn ctermbg=black
highlight LineNr ctermbg=black
highlight LineNr ctermfg=green

"--FUNCTIONALITY--"
" Soft tabs and clever indentation
set smartindent
filetype plugin indent on

set expandtab
set softtabstop=4
set shiftwidth=4

set copyindent
set preserveindent

" Reads and writes to files automatically
set autoread
set autowrite

set scrolloff=7

set mouse=

" Markdown syntax
autocmd BufRead,BufNew *.md set filetype=markdown

" Save readonly files
noremap sudow w !sudo tee % >/dev/null

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


map <C-\> :NERDTreeToggle<CR>
noremap <leader><CR> :noh<CR>

"--PLUGINS--"
call plug#begin ('~/.config/nvim/bundle')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
"Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kshenoy/vim-signature'
"Plug 'Shougo/deoplete.nvim'
call plug#end()

" Airline "
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'base16color'

set lazyredraw
set ttyfast
set regexpengine=1

" Commentary
autocmd FileType lua setlocal commentstring=--\ %s\ --
