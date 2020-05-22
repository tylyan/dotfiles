" VimPlugs
call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
call plug#end()

" Color
set termguicolors
set background=dark
colorscheme dracula " colorscheme
syntax enable       " enable syntax processing
let &t_ut=''

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set smarttab

" UI Config
set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu        
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]

" Searching
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" Folding
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent   "fold based on indent level

" Persistent Undo
set undofile
set undodir=~/.vim/undodir

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

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" toggle plugins
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>l :Limelight!!<CR>
nnoremap <leader>g :Goyo<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" vimwiki
let wiki_hci = {}
let wiki_hci.path = '~/vimwiki/hci'
let wiki_hci.path_html = '~/vimwiki/hci_html'

let g:vimwiki_list = [wiki_hci]

let g:vimtex_quickfix_latexlog = {'default': 0}

augroup VimtexTest
  autocmd!
  autocmd FileType tex :VimtexCompile
augroup end
