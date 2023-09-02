" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colors
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline-themes'

" Editor
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'

" Filesystem
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Lint
Plug 'w0rp/ale'

" Language / Syntax
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'tpope/vim-markdown'

Plug 'github/copilot.vim'

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
set noshowmode
set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
autocmd VimResized * wincmd = " Auto resize splits
autocmd FocusGained * :redraw!
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

" vim-airline
set laststatus=2

" vim-markdown
let g:markdown_fenced_languages = ['javascript', 'go', 'php']

" vim-go
let go_def_mapping_enabled=0

" fzf
function! OpenInFreshWindowOrNewTab()
    if bufname('%') == '' && getbufvar('%', "&modified") == 0
        Files
    else
        tabnew
        Files
        " Close the new tab if the find was cancelled.
        if bufname('%') == ''
            tabclose
        endif
    endif
endfunction
nnoremap <leader>f :call OpenInFreshWindowOrNewTab()<cr>
nnoremap <C-p> :call OpenInFreshWindowOrNewTab()<cr>

" fzf ripgrep
if executable("rg")
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)

    nnoremap <leader>r :Rg<cr>
endif

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
set background=dark
colorscheme onedark
let g:airline_theme='base16_onedark'


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

function! s:goyo_enter()
        set wrap
        set linebreak
        set textwidth=0
        set wrapmargin=0
endfunction

function! s:goyo_leave()
	if winnr('$') < 2
		silent! :q
	endif
endfunction

autocmd BufNewFile,BufRead * call s:auto_goyo()
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
