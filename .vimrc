if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'kien/ctrlp.vim'	
	Plug 'bling/vim-airline'
	Plug 'fatih/vim-go'
call plug#end()

set tabstop=4
map <C-n> :NERDTreeToggle<CR>
