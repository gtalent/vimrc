set nocompatible
"set shell=zsh\ --login

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'nightsense/vimspectr'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'PProvost/vim-ps1'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'blerins/flattown'
Plugin 'cespare/vim-toml'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'luochen1990/rainbow'
Plugin 'majutsushi/tagbar'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'mbbill/undotree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'peterhoeg/vim-qml'
Plugin 'reedes/vim-wordy'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'skammer/vim-css-color'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-obsession'
Plugin 'vim-airline/vim-airline'

call vundle#end()

let g:dirOfCurrentFile = expand('%:p:h')

func! SetupOpeners()
	let l:dirOfCurrentFile = expand('%:p:h') . "/"
	"execute "map <C-W> :enew <BAR> edit " . l:dirOfCurrentFile
	call MapCommand("<C-G>", "vsplit " . l:dirOfCurrentFile)
	call MapCommand("<C-O>", "edit " . l:dirOfCurrentFile)
endfunc

func! SudoWrite()
	write !sudo tee % > /dev/null
	load
endfunc

set nospell
func! SpellCheckToggle()
	if &spell
		set nospell
		echo "Spell check off"
	else
		set spell
		echo "Spell check on"
	endif
endfunc

set expandtab
func! TabToggle()
	if &expandtab
		set shiftwidth=3
		set softtabstop=3
		set noexpandtab
		echo "Now using tabs"
	else
		set shiftwidth=4
		set softtabstop=4
		set expandtab
		echo "Now using spaces"
	endif
endfunc

set shiftwidth=3
set softtabstop=3
set noexpandtab

func! MapCommand(key, com)
	execute "map " . a:key . " :" . a:com
	execute "imap " . a:key . " <ESC>" . a:key
endfunc

func! IMapCommand(key, com)
	execute "imap " . a:key . " :" . a:com
endfunc

" Key mappings
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-I> <C-W><C-I>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
imap <C-BS> <C-W>
map <C-I> :pop<CR>

call SetupOpeners()

call MapCommand("<C-S>", "write<CR>")
map <C-W> :bd<CR>
call MapCommand("<C-TAB>", "bnext<CR>")
call MapCommand("<C-S-TAB>", "bprevious<CR>")
call MapCommand("<C-U>", "UndotreeToggle<CR>")

call MapCommand("<F7>", "call SpellCheckToggle()<CR>")
call MapCommand("<F8>", "call TabToggle()<CR>")
call MapCommand("<F12>", "TagbarToggle<CR>")
call MapCommand("<C-F12>", "NERDTreeToggle<CR>")


command! SudoWrite :call SudoWrite()

hi DiffDelete ctermfg=0 ctermbg=1 guibg='#FE4747'
hi DiffAdd ctermfg=0 ctermbg=2 guibg='#A5EE87'
hi DiffChange ctermfg=0 ctermbg=3 guibg='#5587F7'
hi Todo guifg=#750000 gui=italic
"hi visual guifg=#ffffff guibg=DeepSkyBlue4

"event handlers

func! OnBufEnter()
	call SetupOpeners()
endfunc

set wildignorecase " case-insensitive path completion
set autoindent
set splitright
set splitbelow
"set smartindent
set tabstop=3
set shiftwidth=3
set hlsearch
"set clipboard=unnamed
set bs=2
set guioptions-=L guioptions-=T guioptions-=m guioptions-=r guioptions-=b
set guifont=Fira\ Code\ Regular\ 10
set noerrorbells visualbell t_vb=
set noswapfile
set backspace=2
set hidden "preserve history of hidden buffers
filetype plugin indent on

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=10000
set undoreload=10000

" Turn hybrid line numbers on
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave filetype * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   filetype * set norelativenumber
augroup END


autocmd! GUIEnter * set visualbell t_vb=
autocmd! GUIEnter * GuiTabline 0

syntax on
if has("gui_running")
	colorscheme anderson
else
	colorscheme flattown
endif


set viminfo='10,\"100,:20,%

autocmd! BufEnter * call OnBufEnter()

"let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }

let g:rainbow_active = 1
" doesn't work with CMake files for some reason
autocmd! BufEnter *.cmake RainbowToggleOff
autocmd! BufEnter CMakeLists.txt RainbowToggleOff

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
