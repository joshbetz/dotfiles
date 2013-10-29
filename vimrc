" General Programming
UnBundle 'scrooloose/nerdcommenter'
UnBundle 'godlygeek/tabular'

" Snippets & AutoComplete
UnBundle 'Shougo/neocomplcache'
UnBundle 'Shougo/neosnippet'
UnBundle 'honza/vim-snippets'

" Formatting
set nowrap
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab

set nofoldenable                " disable code folding
set foldlevel=100               " disable code folding
let g:DisableAutoPHPFolding = 1 " disable PIV's folding

set nolist
let g:indent_guides_enable_on_vim_startup = 0

let g:spf13_keep_trailing_whitespace = 1

let NERDTreeQuitOnOpen = 0
nnoremap <Leader>e :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>E :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>

" Auto resize splits
autocmd VimResized * wincmd =
