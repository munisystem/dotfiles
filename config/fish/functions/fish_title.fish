# https://github.com/fisherman/vibrant/blob/master/functions/fish_title.fish
function fish_title; echo (pwd | command sed "s:^$HOME:~:"); end
