function! LoadGeneralProfile()
	call MapCommand("<C-O>", "write<CR>")
	call MapCommand("<C-F4>", "quit<CR>")
	call MapCommand("<C-Y>", "tabnew ")
	call MapCommand("<C-K>", "vsplit  ")
	call MapCommand("<C-R>", "edit ")
	call MapCommand("<C-P>", "redo<CR>")
	call MapCommand("<C-TAB>", "tabn<CR>")
	call MapCommand("<C-S-TAB>", "tabp<CR>")
	call MapCommand("<A-S-U>", "w<BAR>make fmt<BAR>o<CR>")

	call MapCommand("<F5>", "write<BAR>make<CR>")
	call MapCommand("<C-F5>", "write<BAR>make ")

	call MapCommand("<F2>", "call Svndiff(\"prev\")<CR>")
	call MapCommand("<F3>", "call Svndiff(\"next\")<CR>")
	call MapCommand("<F4>", "call Svndiff(\"clear\")<CR>")
	call MapCommand("<F12>", "TagbarToggle<CR>")
	call MapCommand("<C-F12>", "NERDTreeToggle<CR>")
	
	let g:svndiff_autoupdate=1
	hi DiffDelete ctermfg=0 ctermbg=1 guibg='red'
	hi DiffAdd ctermfg=0 ctermbg=2 guibg='green'
	hi DiffChange ctermfg=0 ctermbg=3 guibg='blue'
endfunction
