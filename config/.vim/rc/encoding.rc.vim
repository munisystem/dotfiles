"------------------------------------------------------
" encoding.rc.vim

if has('vim_starting')
  set encoding=utf-8
endif

if !has('gui_running')
  if $ENV_ACCESS ==# 'linux'
    set termencoding=utf-8
  else
    set termencoding=
  endif
elseif IsWindows()
  set termencoding=cp932
endif

set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set ffs=unix,dos,mac

if exists('&ambiwidth')
  set ambiwidth=double
endif

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif
