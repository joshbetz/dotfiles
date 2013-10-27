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

set nofoldenable " Disable folding

let NERDTreeQuitOnOpen = 0
nnoremap <Leader>e :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>E :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>
