" set t_Co=256
set tabstop=4
set autowrite
let mapleader = ','

"Credit joshdick
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
	" Plug 'flazz/vim-colorschemes'
	Plug 'posva/vim-vue'
	Plug 'plasticboy/vim-markdown'
	" Plug 'rakr/vim-one'
	Plug 'chriskempson/base16-vim'
	" Plug 'nlknguyen/papercolor-theme'
	Plug 'tpope/vim-surround'
	Plug 'cespare/vim-toml'
	Plug 'ekalinin/dockerfile.vim'
	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'zchee/deoplete-go', { 'do': 'make'}
	Plug 'shougo/neco-syntax'
call plug#end()

" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary	= $GOPATH.'/bin/gocode'

set background=dark
colorscheme base16-tomorrow-night
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_tomorrow'
" map <C-n> :NERDTreeToggle<CR>

let g:lsc_server_commands = {'rust': 'rls-preview'}

" vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
"--------
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>f <Plug>(go-test-func)

