set t_Co=256

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
	"	Plug 'flazz/vim-colorschemes'
	Plug 'posva/vim-vue'
	Plug 'plasticboy/vim-markdown'
	Plug 'rakr/vim-one'
	Plug 'nlknguyen/papercolor-theme'
	Plug 'cespare/vim-toml'
call plug#end()

set background=dark
colorscheme PaperColor
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
set tabstop=4
map <C-n> :NERDTreeToggle<CR>

let g:lsc_server_commands = {'rust': 'rls-preview'}
