function! MapCommand(key, com)
	execute "map " . a:key . " S" . a:com
	execute "imap " . a:key . " <ESC>" . a:key
endfunction

function! IMapCommand(key, com)
	execute "imap " . a:key . " S" . a:com
endfunction
