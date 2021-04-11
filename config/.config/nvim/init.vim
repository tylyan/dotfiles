" VimPlugs
call plug#begin(stdpath('data') . '/plugged')
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'

" Experimental
Plug 'junegunn/fzf'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
call plug#end()

" Color
colorscheme dracula
let &t_ut=''
set background=dark
set termguicolors
syntax enable

" Spaces & Tabs
set expandtab       " tabs are spaces
set shiftwidth=4
set softtabstop=4   " number of spaces in tab when editing
set tabstop=4       " number of visual spaces per TAB

" UI Config
filetype indent on  " load filetype-specific indent files
set cursorline      " highlight current line
set lazyredraw      " redraw only when we need to
set number
set relativenumber
set showcmd         " show command in bottom bar
set showmatch       " highlight matching [{()}]

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " 10 nested fold max

" Persistent Undo
set undodir=~/.vim/undodir
set undofile

" Set Hidden Buffer
set hidden

" Mappings
let mapleader=","

" lazy command mode
nnoremap ; :
nnoremap : ;

" exit insert mode
imap jk <Esc>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" Plugins
nnoremap <leader>t :NERDTreeToggle<CR>

" CoC
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
