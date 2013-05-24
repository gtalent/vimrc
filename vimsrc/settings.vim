"set nomodeline
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set nu
set hlsearch
set autochdir
set clipboard=unnamed
set bs=2
set guioptions-=L guioptions-=T guioptions-=m guioptions-=r guioptions-=b
set noerrorbells visualbell t_vb=
set noswapfile
autocmd GUIEnter * set visualbell t_vb=

syntax on
colorscheme wombat
hi Search guibg=DeepSkyBlue4

set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

set viminfo='10,\"100,:20,%
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
