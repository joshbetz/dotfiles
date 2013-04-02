" Hack to fix solarized with spf13 -> https://github.com/spf13/spf13-vim/issues/240#issuecomment-15154420
set background=dark
let g:solarized_termcolors=16
color solarized

" Use Tabs, not spaces
set noexpandtab

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Reload files changed outside vim
set autoread

" Don't fold code by default
set nofoldenable

" Enable per-directory .vimrc files
set exrc
set secure

" Turn Off Swap FileS
set noswapfile
set nobackup
set nowb

" Navigate panes
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" line up markdown tables with Tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
	let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
	let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
	Tabularize/|/l1
	normal! 0
	call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" NERDTree configuration
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
map <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Strip trailing whitespace
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" Fast escape
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif
