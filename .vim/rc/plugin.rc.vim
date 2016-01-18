"------------------------------------------------------
" plugin.rc.vim

" Vim=Plug
if has('vim_starting')
  set rtp+=$HOME/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

  " Loading Plugins
  runt! rc/plugins/*.vim
call plug#end()
