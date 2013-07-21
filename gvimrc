set guifont=Inconsolata\ for\ Powerline:h14

" Remove unecessary application chrome
set guioptions-=T " Removes top toolbara
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" Local Gvim config
if filereadable(expand("~/.gvimrc.local"))
	source ~/.gvimrc.local
endif
