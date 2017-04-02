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


" Editor
syntax enable
colorscheme Tomorrow-Night-Eighties
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
