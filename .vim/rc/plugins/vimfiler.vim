Plug 'Shougo/vimfiler'

let g:vimfiler_safe_mode_by_default = 0

" Icons
let g:vimfiler_tree_leaf_icon   = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon        = '-'
let g:vimfiler_marked_file_icon = '*'

" Keybinds
nnoremap <silent> ,<C-f> :<C-u>VimFilerBufferDir -simple<CR>
nnoremap <silent> .<C-f> :<C-u>VimFilerBufferDir -split -simple -winwidth=40<CR>
