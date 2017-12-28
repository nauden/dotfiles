call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'kien/ctrlp.vim'	
	Plug 'bling/vim-airline'
	Plug 'fatih/vim-go'
call plug#end()

set tabstop=4
map <C-n> :NERDTreeToggle<CR>
