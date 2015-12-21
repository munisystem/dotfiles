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
