" General Programming
UnBundle 'scrooloose/nerdcommenter'
UnBundle 'godlygeek/tabular'

" Snippets & AutoComplete
UnBundle 'Shougo/neocomplcache'
UnBundle 'Shougo/neosnippet'
UnBundle 'honza/vim-snippets'

set nofoldenable                " disable code folding
let g:DisableAutoPHPFolding = 1 " disable PIV's folding

let g:indent_guides_enable_on_vim_startup = 0

let g:spf13_keep_trailing_whitespace = 1

let NERDTreeQuitOnOpen = 0
nnoremap <Leader>e :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>E :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>

" Auto resize splits
autocmd VimResized * wincmd =

" Scroll with up/down arrow keys
map <Up> <c-u>
map <Down> <c-d>

" Switch splits with left/right arrow keys
map <Right> <c-w>l
map <Left> <c-w>h
