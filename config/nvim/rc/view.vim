"------------------------------------------------------
" view.rc.vim

" Colorscheme
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme iceberg

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
set listchars=tab:▸-,trail:-,extends:»,precedes:«,nbsp:%

" Title
set title
set titlelen=90

" Show cmd
set noshowcmd

" Parenthesis
set showmatch
set matchtime=2
