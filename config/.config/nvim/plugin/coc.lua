vim.cmd[[
  let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-toml',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-go',
  \ 'coc-copilot',
  \ 'coc-highlight',
  \ 'coc-lua'
  \ ]

  autocmd VimEnter * hi CocMenuSel guibg=#274964
  autocmd CursorHold * silent call CocActionAsync('highlight')

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nnoremap <silent> gh :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
]]
