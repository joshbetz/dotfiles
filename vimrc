set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" Editor
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'junegunn/goyo.vim'

" Syntax
Bundle 'joshdick/onedark.vim'
Bundle 'vim-syntastic/syntastic'
Bundle 'mtscout6/syntastic-local-eslint.vim'
Bundle 'fatih/vim-go'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
scriptencoding utf-8


" OS Interaction
set mouse=a
set mousehide


" Formatting
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab

" Colors
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
	if (has("nvim"))
		"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
		set termguicolors
	endif
endif
syntax enable
colorscheme onedark
let g:airline_theme='onedark'

" Editor
set scrolloff=3
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap
set viewoptions=folds,options,cursor,unix,slash
set hidden
set backspace=2
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd VimResized * wincmd = " Auto resize splits
au FocusGained * :redraw!


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
au FocusLost * silent! :wa " Auto save on lost focus
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Auto filetype

" Spell check
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

" Filesystem
set wildmode=longest,list

" Shortcuts
let mapleader = ','

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" I never use ; anyway
nnoremap ; :
nnoremap <leader>; ;

" Scroll with up/down arrow keys
map <Up> 2<C-y>
map <Down> 2<C-e>

" Switch splits with left/right arrow keys
map <Right> <c-w>l
map <Left> <c-w>h
map <c-h> <c-w>h
map <c-l> <c-w>l

" Conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflict markers
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR> " jump to conflict markers

" vim-airline
set laststatus=2

" Gitgutter
autocmd FocusGained * call gitgutter#all()

" vim-markdown
let g:markdown_fenced_languages = ['javascript', 'go', 'php']

" Goyo
function! s:auto_goyo()
	if &ft == 'markdown' && winnr('$') == 1
		Goyo 80
	elseif exists('#goyo')
		Goyo!
	endif
endfunction

function! s:goyo_leave()
	if winnr('$') < 2
		silent! :q
	endif
endfunction

augroup goyo_markdown
	autocmd!
	autocmd BufNewFile,BufRead * call s:auto_goyo()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
