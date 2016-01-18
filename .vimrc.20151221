" General {{{
scriptencoding utf-8
"}}}
" neobundle {{{
set nocompatible
filetype plugin indent on

if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" neobundleをneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"}}}
" plugins {{{
" Unite.vim
NeoBundle 'Shougo/unite.vim'

"------------------------------------------------------
" vimproc
NeoBundle 'Shougo/vimproc.vim' , {
        \ 'build': {
        \ 'windows' : 'tools¥¥update-dll-mingw',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
        \ },
        \}

"------------------------------------------------------
" vimfiler
NeoBundle 'Shougo/vimfiler'
let g:vimfiler_safe_mode_by_default = 0
" vimfiler icon
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" keybinds
nnoremap <silent> ,<C-f> :<C-u>VimFilerBufferDir -simple<CR>
nnoremap <silent> .<C-f> :<C-u>VimFilerBufferDir -split -simple -winwidth=40<CR>
"------------------------------------------------------
" 書いているプログラムを即時実行できるプラグイン
NeoBundle 'thinca/vim-quickrun'

"------------------------------------------------------
" indent
NeoBundle 'vim-scripts/Align'
" indent on color
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
" 自動カラーの無効
"let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" 色の変化の幅
"let g:indent_guides_color_change_percent=30
" ガイドの幅
let g:indent_guides_guide_size=2

"------------------------------------------------------
" Colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jpo/vim-railscasts-theme'

"------------------------------------------------------
" NeoComplete
NeoBundle 'Shougo/neocomplete.vim'
" ポップアップ見やすくしたい
"hi Pmenu guibg=#f5f5dc guifg=#000000
"hi PmenuSel guibg=#0000ff guifg=#ffffff
"hi PmenuSbar guibg=#aaaaaa
" neocompleteを起動時に有効化
let g:neocomplete#enable_at_startup = 1
" 大文字が入力されるまで大文字小文字を無視
let g:neocomplete#enable_smart_case = 1
" アンダーバー区切りの保管を有効化
let g:neocomplete#enable_underbar_completion = 1
" キャッシュの最大文字数を3文字に
let g:neocomplete#min_syntax_length = 3

"------------------------------------------------------
" NeoSnippet
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets/, ~/.vim/bundle/neosnippet-snippets/snippets/'
let g:neosnippet#snippets_directory='~/.vim/snippets/'
" TABキーで補完の移動をしたい
inoremap <expr><TAB> pumvisible() ? "\<C-p>" : "<TAB>
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Ctrl+kで展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
nmap g/ :Unite -buffer-name=search line:forward -start-insert -auto-highlight<CR>

"------------------------------------------------------
" lightline
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'

set guifont=Ricty\ 18

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [  [ 'mode', 'paste' ],
      \              [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

set laststatus=2

"------------------------------------------------------
" memolist
NeoBundle 'glidenote/memolist.vim'

let g:memolist_memo_suffix = "md"
let g:memolist_filename_prefix_none = 1
let g:memolist_path = "~/Dropbox/memo"
let g:memolist_template_dir_path = "~/Dropbox/memo/templates"

"------------------------------------------------------
" easy commentout
NeoBundle 'scrooloose/nerdcommenter'

let g:NERDCreateDefaultMapping = 0
let g:NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

"------------------------------------------------------
" html
" 括弧つけるプラグイン
NeoBundle 'tpope/vim-surround'
" htmlタグを一発保管するプラグイン
NeoBundle 'Emmet.vim'
let g:user_emmet_settings = {
            \'lang' : 'ja'
            \}

"------------------------------------------------------
" auto close parenthesis
NeoBundle 'cohama/lexima.vim'
let g:lexima_enable_basic_rules = 1

"------------------------------------------------------
" others
" binary
NeoBundle 'Shougo/vinarise.vim'
" whitespace
NeoBundle 'ntpeters/vim-better-whitespace'

call neobundle#end()
NeoBundleCheck
"}}}
" Colorcheme {{{
colorscheme molokai
syntax enable
set t_Co=256
"let g:solarized_termcolors=256
"}}}
" gvim設定 {{{
"autocmd FocusGained * set transparency=235
"autocmd FocusLost * set transparency=200

set guioptions=arc

" ツールバーメニューバーを非表示
"set guioptions-=T
"set guioptions-=m

" スクロールバーを非表示
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

" default window size
if has('gui_running')
  set columns=100
  set lines=30
endif
"}}}
" vimの細かな設定 {{{
"syntax有効化
syntax on
" ESCをjjで可能に
" inoremap jj <ESC>
" クリップボード共有化
set clipboard^=unnamed,unnamedplus
" undoを生成しない
set nowritebackup
set noundofile
" undoしない
set nobackup
" .swapを生成しない
set noswapfile
" 行番号表示
set number
" 対応括弧に<>を追加
set matchpairs& matchpairs+=<:>
" 対応括弧を2sだけハイライト
set showmatch
set matchtime=2
" 補完に大文字小文字を区別させない
set ignorecase
" 文字がない場所にカーソル移動できるようにする
"set virtualedit=all
" IMIデフォルトOFF
set iminsert=0
set imsearch=0
" 検索をハイライトさせない
set nohlsearch
" tab関連
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
" 折りたたみ
set foldmethod=marker
set modelines=3
set foldcolumn=3
"}}}
