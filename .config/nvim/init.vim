" set runtimepath+=~/.vim
" set packpath+=~/.vim
" 
" source ~/.vimrc



set ts=2 sw=2
set autowrite
set ignorecase smartcase
let mapleader = ','
set number relativenumber
language en_US.utf8

" Ctrl hjkl move between windows
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" follow links in help
nnoremap <leader>g <C-]>

augroup myvimrchooks
	au!
	autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END


augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

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


if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'pbrisbin/vim-mkdir'
"Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
" Plug 'flazz/vim-colorschemes'
"Plug 'posva/vim-vue'
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
"Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'sirtaj/vim-openscad'
" Plug 'elmcast/elm-vim'
Plug 'sebdah/vim-delve'
"Plug 'burner/vim-svelte'
Plug 'ryanoasis/vim-devicons'
"Plug 'leafgarland/typescript-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ap/vim-css-color'
"Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
call plug#end()

" elixir format
let g:mix_format_on_save = 1

" disable markdown folding
let g:vim_markdown_folding_disabled = 1

" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#builtin_objects = 1
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#gocode_binary	= $GOPATH.'/bin/gocode'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif


set background=dark
" colorscheme base16-synth-midnight-dark
colorscheme jellybeans
" let g:airline_powerline_fonts = 1
" let g:airline_theme='simple'
let g:airline_theme='jellybeans'
" map <C-n> :NERDTreeToggle<CR>

" vim-go
let g:go_list_type = 'quickfix'
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_autosave = 0
"let g:go_metalinter_autosave_enabled = ['golint', 'deadcode', 'govet', 'ineffassign', 'staticcheck', 'structcheck', 'typecheck', 'unused', 'varcheck' ]


"! 'bodyclose: checks whether HTTP response body is closed successfully [fast: true, auto-fix: false]
"! 'depguard: Go linter that checks if package imports are in a list of acceptable packages [fast: true, auto-fix: false]
"! 'dogsled: Checks assignments with too many blank identifiers (e.g. x, _, _, _, := f()) [fast: true, auto-fix: false]
"! 'dupl: Tool for code clone detection [fast: true, auto-fix: false]
"! 'funlen: Tool for detection of long functions [fast: true, auto-fix: false]
"! 'gochecknoglobals: Checks that no globals are present in Go code [fast: true, auto-fix: false]
"! 'gochecknoinits: Checks that no init functions are present in Go code [fast: true, auto-fix: false]
"! 'gocognit: Computes and checks the cognitive complexity of functions [fast: true, auto-fix: false]
"! 'goconst: Finds repeated strings that could be replaced by a constant [fast: true, auto-fix: false]
"! 'gocritic: The most opinionated Go source code linter [fast: true, auto-fix: false]
"! 'gocyclo: Computes and checks the cyclomatic complexity of functions [fast: true, auto-fix: false]
"! 'godox: Tool for detection of FIXME, TODO and other comment keywords [fast: true, auto-fix: false]
"! 'gofmt: Gofmt checks whether code was gofmt-ed. By default this tool runs with -s option to check for code simplification [fast: true, auto-fix: true]
"! 'goimports: Goimports does everything that gofmt does. Additionally it checks unused imports [fast: true, auto-fix: true]
"! 'golint: Golint differs from gofmt. Gofmt reformats Go source code, whereas golint prints out style mistakes [fast: true, auto-fix: false]
"! 'gomnd: An analyzer to detect magic numbers. [fast: true, auto-fix: false]
"! 'gosec (gas): Inspects source code for security problems [fast: true, auto-fix: false]
"! 'interfacer: Linter that suggests narrower interface types [fast: true, auto-fix: false]
"! 'lll: Reports long lines [fast: true, auto-fix: false]
"! 'maligned: Tool to detect Go structs that would take less memory if their fields were sorted [fast: true, auto-fix: false]
"! 'misspell: Finds commonly misspelled English words in comments [fast: true, auto-fix: true]
"! 'nakedret: Finds naked returns in functions greater than a specified function length [fast: true, auto-fix: false]
"! 'prealloc: Finds slice declarations that could potentially be preallocated [fast: true, auto-fix: false]
"! 'scopelint: Scopelint checks for unpinned variables in go programs [fast: true, auto-fix: false]
"! 'stylecheck: Stylecheck is a replacement for golint [fast: true, auto-fix: false]
"! 'unconvert: Remove unnecessary type conversions [fast: true, auto-fix: false]
"! 'unparam: Reports unused function parameters [fast: true, auto-fix: false]
"! 'whitespace: Tool for detection of leading and trailing whitespace [fast: true, auto-fix: true]
"! 'wsl: Whitespace Linter - Forces you to use empty lines! [fast: true, auto-fix: false]
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>
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
autocmd FileType go nmap <leader>i <Plug>(go-install)

" vim-delve
let g:delve_new_command = 'enew'
