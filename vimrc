set nocompatible
set shell=zsh\ --login

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'blerins/flattown'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'peterhoeg/vim-qml'
Plugin 'scrooloose/nerdtree'
Plugin 'skammer/vim-css-color'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'wting/rust.vim'

call vundle#end()

let g:dirOfCurrentFile = expand('%:p:h')

func! SetupOpeners()
	let l:dirOfCurrentFile = expand('%:p:h') . "/"
	call MapCommand("<C-T>", "tabnew " . l:dirOfCurrentFile)
	call MapCommand("<C-G>", "vsplit " . l:dirOfCurrentFile)
	call MapCommand("<C-O>", "edit " . l:dirOfCurrentFile)
endfunc

func! LoadGeneralProfile()
	noremap <C-H> <C-W><C-H>
	noremap <C-J> <C-W><C-J>
	noremap <C-K> <C-W><C-K>
	noremap <C-L> <C-W><C-L>
	imap <C-BS> <C-W>
	call SetupOpeners()
	call MapCommand("<C-S>", "write<CR>")
	call MapCommand("<C-K>", "pop<CR>")
	call MapCommand("<C-R>", "redo<CR>")
	call MapCommand("<C-F4>", "quit<CR>")
	call MapCommand("<C-F5>", "write<BAR>make ")

	call MapCommand("<C-TAB>", "tabnext<CR>")
	call MapCommand("<C-S-TAB>", "tabprevious<CR>")

	call MapCommand("<F2>", "call Svndiff(\"prev\")<CR>")
	call MapCommand("<F3>", "call Svndiff(\"next\")<CR>")
	call MapCommand("<F4>", "call Svndiff(\"clear\")<CR>")
	call MapCommand("<F12>", "TagbarToggle<CR>")
	call MapCommand("<C-F12>", "NERDTreeToggle<CR>")

	let g:svndiff_autoupdate=1
	hi DiffDelete ctermfg=0 ctermbg=1 guibg='#FE4747'
	hi DiffAdd ctermfg=0 ctermbg=2 guibg='#A5EE87'
	hi DiffChange ctermfg=0 ctermbg=3 guibg='#5587F7'
	hi Todo guifg=#750000 gui=italic
	hi visual guifg=#ffffff guibg=DeepSkyBlue4
endfunc

func! MapCommand(key, com)
	execute "map " . a:key . " :" . a:com
	execute "imap " . a:key . " <ESC>" . a:key
endfunc

func! IMapCommand(key, com)
	execute "imap " . a:key . " :" . a:com
endfunc


"event handlers

func! OnBufEnter()
	call SetupOpeners()
endfunc

set autoindent
set splitright
set splitbelow
set smartindent
set tabstop=3
set shiftwidth=3
set nu
set hlsearch
set clipboard=unnamed
set bs=2
set guioptions-=L guioptions-=T guioptions-=m guioptions-=r guioptions-=b
set noerrorbells visualbell t_vb=
set noswapfile
set backspace=2
autocmd! GUIEnter * set visualbell t_vb=

syntax on
if has("gui_running")
	colorscheme wombatant
	set spell
else
	colorscheme delek
endif

set viminfo='10,\"100,:20,%

autocmd! BufEnter * call OnBufEnter()

"let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }

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

call LoadGeneralProfile()
