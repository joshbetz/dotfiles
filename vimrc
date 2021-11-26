" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colors
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'

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
let g:ale_fixers.php = ['phpcbf']
let g:ale_fix_on_save = 1
command! ALEDisableFixers       let g:ale_fix_on_save=0

""
" Editor
""
set encoding=utf8
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
syntax enable
set background=dark
let g:solarized_termcolors=16
colorscheme solarized
let g:airline_theme='base16_solarized_dark'


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
