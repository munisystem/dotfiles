function! s:source_rc(path)
  execute 'source' fnameescape(expand('$XDG_CONFIG_HOME/nvim/rc/' . a:path))
endfunction

call s:source_rc('encoding.vim')

call s:source_rc('vimrc')
