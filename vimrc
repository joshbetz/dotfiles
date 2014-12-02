set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" Editor
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-sleuth'

" Syntax
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
scriptencoding utf-8


" OS Interaction
set mouse=a
set mousehide
set clipboard=unnamed


" Formatting
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab


" Editor
syntax enable
colorscheme Tomorrow-Night-Eighties
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap
set viewoptions=folds,options,cursor,unix,slash
set hidden
set backspace=2


" Search
set showmatch
set incsearch
set hlsearch
set ignorecase
nnoremap / /\v
vnoremap / /\v


" Files
set nobackup
set noswapfile
set autoread


" Shortcuts
let mapleader = ','

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Quickly close current window or buffer
nnoremap <leader>Q :q<CR>
nnoremap <leader>q :bd<CR>

" I never use ; anyway
nnoremap ; :
nnoremap <leader>; ;

" Scroll with up/down arrow keys
map <Up> 2<C-e>
map <Down> 2<C-y>

" Switch splits with left/right arrow keys
map <Right> <c-w>l
map <Left> <c-w>h
map <c-h> <c-w>h
map <c-l> <c-w>l

" Conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflict markers
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR> " jump to conflict markers


" Relative line numbers
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Auto filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Auto resize splits
autocmd VimResized * wincmd =

" Autosave on lost focus
au FocusLost * :wa


" NERDTree Config
let NERDTreeMouseMode=2
nnoremap <Leader>e :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>E :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>

" vim-airline
set laststatus=2
let g:airline_left_sep='›'
let g:airline_right_sep='‹'
