function! s:source_rc(path)
  execute 'source' fnameescape(expand('$XDG_CONFIG_HOME/nvim/rc/' . a:path))
endfunction

augroup MyAutoCmd
  autocmd!
augroup END

call s:source_rc('encoding.vim')

call s:source_rc('vimrc')

call s:source_rc('plugin.vim')

call s:source_rc('view.vim')
