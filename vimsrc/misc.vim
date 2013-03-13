function! ResCur()
	if line("-\_") <= line("$")
		normal! i`"
		return 1
	endif
endfunction


