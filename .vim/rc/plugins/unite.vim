"------------------------------------------------------
" User interface plugin
"
" Usage
" Type ':Unite file buffer'
" Type ',g' and type '<Grep word>'

Plug 'Shougo/unite.vim'

nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" Depending The Silver Searcher
if executable('ag')
  let g:unite_source_grep_command       = 'ag'
  let g:unite_source_grep_default_opts  = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
