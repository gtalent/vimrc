set shell=bash\ --login

source ~/.vimsrc/vimsrc.vim

call pathogen#infect()

set nomodeline
set autoindent
set smartindent
set tabstop=3
set shiftwidth=3
set nu
set hlsearch
set autochdir
set clipboard=unnamed
set bs=2
set guioptions-=L guioptions-=T guioptions-=m guioptions-=r guioptions-=b
colorscheme slate
syntax on

hi Search guibg=navy

set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

call LoadGeneralProfile()

set viminfo='10,\"100,:20,%
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END
