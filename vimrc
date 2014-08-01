set shell=bash\ --login

call pathogen#infect()

function! LoadGeneralProfile()
	imap <C-BS> <C-W>
	call MapCommand("<C-S>", "write<CR>")
	call MapCommand("<C-F4>", "quit<CR>")
	call MapCommand("<C-K>", "pop<CR>")
	call MapCommand("<C-T>", "tabnew ")
	call MapCommand("<C-Y>", "vsplit ")
	call MapCommand("<C-H>", "split ")
	call MapCommand("<C-O>", "edit ")
	call MapCommand("<C-R>", "redo<CR>")
	call MapCommand("<C-TAB>", "tabn<CR>")
	call MapCommand("<C-S-TAB>", "tabp<CR>")
	call MapCommand("<A-S-F>", "write<BAR>make fmt<BAR>o<CR>")

	call MapCommand("<F5>", "write<BAR>make ")
	call MapCommand("<C-B>", "write<BAR>make<CR>")
	call MapCommand("<C-F5>", "write<BAR>make ")

	call MapCommand("<F2>", "call Svndiff(\"prev\")<CR>")
	call MapCommand("<F3>", "call Svndiff(\"next\")<CR>")
	call MapCommand("<F4>", "call Svndiff(\"clear\")<CR>")
	call MapCommand("<F12>", "TagbarToggle<CR>")
	call MapCommand("<C-F12>", "NERDTreeToggle<CR>")
	
	call MapCommand("<A-B>", "call MultiCursorVisual()<CR>")
	let g:multicursor_quit="<C-B>"

	let g:svndiff_autoupdate=1
	hi DiffDelete ctermfg=0 ctermbg=1 guibg='#FE4747'
	hi DiffAdd ctermfg=0 ctermbg=2 guibg='#A5EE87'
	hi DiffChange ctermfg=0 ctermbg=3 guibg='#5587F7'
endfunction

function! MapCommand(key, com)
	execute "map " . a:key . " :" . a:com
	execute "imap " . a:key . " <ESC>" . a:key
endfunction

function! IMapCommand(key, com)
	execute "imap " . a:key . " :" . a:com
endfunction

function! ResCur()
	"if line("-\_") <= line("$")
	"	normal! i`"
	"	return 1
	"endif
endfunction

"set nomodeline
set autoindent
set smartindent
set tabstop=3
set shiftwidth=3
set nu
set hlsearch
"set autochdir
set clipboard=unnamed
set bs=2
set guioptions-=L guioptions-=T guioptions-=m guioptions-=r guioptions-=b
set noerrorbells visualbell t_vb=
set noswapfile
set backspace=2
set nocompatible
autocmd GUIEnter * set visualbell t_vb=

syntax on
if has("gui_running")
	colorscheme wombat
else
	colorscheme delek
endif
hi Search guibg=DeepSkyBlue4

set viminfo='10,\"100,:20,%
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
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
