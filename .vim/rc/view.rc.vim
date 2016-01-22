"------------------------------------------------------
" gvimrc

" Colorscheme
colorscheme Tomorrow-Night-Bright
set t_Co=256

" Status line
set laststatus=2

" Indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" Line number
set nu

" List
set list
if IsWindows()
  set listchars=tab:>-,trail:-,extends:>,precedes:<
else
  set listchars=tab:▸-,trail:-,extends:»,precedes:«,nbsp:%
endif

" Title
set title
set titlelen=90

" Show cmd
set noshowcmd

" Parenthesis
set showmatch
set matchtime=2
