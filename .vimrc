if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'kien/ctrlp.vim'	
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'fatih/vim-go'
	Plug 'flazz/vim-colorschemes'
	Plug 'posva/vim-vue'
call plug#end()

colorscheme 256-grayvim 
let g:airline_powerline_fonts = 1
set tabstop=4
map <C-n> :NERDTreeToggle<CR>
