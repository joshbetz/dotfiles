" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colors
Plug 'joshdick/onedark.vim'

" Editor
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'

" Lint
Plug 'w0rp/ale'

" Language / Syntax
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'flowtype/vim-flow'
Plug 'leafgarland/typescript-vim'

" Initialize plugin system
call plug#end()

""
" OS Interaction
""
set mouse=a
set mousehide

""
" Use new regular expression engine (helps with performance)
""
set re=0

""
" Formatting
""
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab

""
" Lint
""
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1

""
" Editor
""
set scrolloff=3
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap
set viewoptions=folds,options,cursor,unix,slash
set hidden
set backspace=2
set relativenumber
set noshowmode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd VimResized * wincmd = " Auto resize splits
au FocusGained * :redraw!
set t_RV=


""
" Search
""
set showmatch
set incsearch
set hlsearch
set ignorecase  " ignore the case
set smartcase   " but not when the search pattern contains uppercase
set ttyfast
set lazyredraw
nnoremap / /\v
vnoremap / /\v


""
" Files
""
set nobackup
set noswapfile
set autoread
au FocusLost * silent! :wa " Auto save on lost focus
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Auto filetype


""
" Tabs
""
nnoremap <C-t> :tabnew<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
inoremap <C-t> <esc>:tabnew<CR>
inoremap <C-h> <esc>:tabprevious<CR>
inoremap <C-l> <esc>:tabnext<CR>


""
" Spell check
""
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline


""
" Filesystem
""
set wildmode=longest,list


""
" Shortcuts
""
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

" Conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflict markers
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR> " jump to conflict markers


""
" File Type Customizations
""

" crontab
autocmd filetype crontab setlocal nobackup nowritebackup


""
" Plugins
""

" gitgutter
autocmd BufWritePost * GitGutter

" ctrlp
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 100 " cache if > 100 files
let g:ctrlp_max_depth = 10

" vim-airline
set laststatus=2

" vim-markdown
let g:markdown_fenced_languages = ['javascript', 'go', 'php']

" vim-go
let go_def_mapping_enabled=0


""
" Colors
""
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


""
" Goyo
""
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
