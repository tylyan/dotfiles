" VimPlug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VimPlugs
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

" Color
colorscheme seoul256 " colorscheme
syntax enable       " enable syntax processing

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

" save session
nnoremap <leader>s :mksession<CR>
" toggle nerdtree
nnoremap <leader>t :NERDTreeToggle<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

nnoremap <leader>l :Limelight!!<CR>
nnoremap <leader>g :Goyo<CR>

" adding a comment
