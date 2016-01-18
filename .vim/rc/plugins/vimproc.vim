"------------------------------------------------------
" Async execution for VIM

function! MakeVimproc(info)
  if a:info.status == 'installed' || a:info.force
    if IsWindows()
      !tools\\update-dll-mingw
    elseif has('unix')
      !make -f make_unix.mak
    elseif has('mac')
      !make -f make_mac.mak
    endif
  endif
endfunction

Plug 'Shougo/vimproc', { 'do': function('MakeVimproc') }
