set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

Bundle 'scrooloose/syntastic'

Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" =====================================================
" My Config
" =====================================================

syntax on
colorscheme Tomorrow-Night
set t_Co=256

set mouse=a

set cursorline
set linespace=0
set showmatch
set incsearch
set relativenumber
set hlsearch
set ignorecase
set smartcase
set scrolljump=5
set scrolloff=3

" Absolute line numbers in insert mode, and relative in normal mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Formatting
set nowrap
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Backups are nice
set backup
if has('persistent_undo')
	set undofile                " So is persistent undo ...
	set undolevels=1000         " Maximum number of changes that can be undone
	set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" =====================================================
" Powerline
" =====================================================

set ruler                   " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 " Show partial commands in status line and
                            " Selected characters/lines in visual mode

set laststatus=2


" =====================================================
" Alternate Configs
" =====================================================

" Use local vimrc if available 
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

" Reload vimrc live
autocmd bufwritepost .vimrc source $MYVIMRC


" =====================================================
" Initialize directories
" =====================================================

function! InitializeDirectories()
	let parent = $HOME
	let prefix = 'vim'
	let dir_list = {
		\ 'backup': 'backupdir',
		\ 'views': 'viewdir',
		\ 'swap': 'directory' }

	if has('persistent_undo')
		let dir_list['undo'] = 'undodir'
	endif

	" To specify a different directory in which to place the vimbackup,
	" vimviews, vimundo, and vimswap files/directories, add the following to
	" your .vimrc.local file:
	"   let g:spf13_consolidated_directory = <full path to desired directory>
	"   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
	if exists('g:spf13_consolidated_directory')
		let common_dir = g:spf13_consolidated_directory . prefix
	else
		let common_dir = parent . '/.' . prefix
	endif

	for [dirname, settingname] in items(dir_list)
		let directory = common_dir . dirname . '/'
		if exists("*mkdir")
			if !isdirectory(directory)
				call mkdir(directory)
			endif
		endif
		if !isdirectory(directory)
			echo "Warning: Unable to create backup directory: " . directory
			echo "Try: mkdir -p " . directory
		else
			let directory = substitute(directory, " ", "\\\\ ", "g")
			exec "set " . settingname . "=" . directory
		endif
	endfor
endfunction

call InitializeDirectories()
