let s:is_windows = has('win16') || has('win32') || has('win64')
function! IsWindows()
  return s:is_windows
endfunction

" English interface
if IsWindows()
  language message en
else
  language message C
endif

" path separator to /
if IsWindows()
  set shellslash
endif

augroup MyAutoCmd
  autocmd!
augroup END

function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

call s:source_rc('encoding.rc.vim')

" General
call s:source_rc('vimrc')

" GUI
call s:source_rc('gvimrc')

" General
call s:source_rc('plugin.rc.vim')

" View
call s:source_rc('view.rc.vim')
