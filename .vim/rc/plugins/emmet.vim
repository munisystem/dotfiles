"------------------------------------------------------
" Expanding abbreviations similar to emmet
"
" Usage
" Type 'html:5' then type '<C-Y>,'
"
" You should see:
"
" <!DOCTYPE html>
"<html lang="en">
"<head>
"  <meta charset="UTF-8">
"  <title></title>
"</head>
"<body>
"
"</body>
"</html>

Plug 'Emmet.vim'

let g:user_emmet_settings = {
          \'lang' : 'ja'
          \ }
