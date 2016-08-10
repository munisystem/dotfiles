# https://github.com/fisherman/vibrant/blob/master/functions/fish_prompt.fish
set __fish_git_prompt_color_branch blue

set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_stateseparator ' '

set __fish_git_prompt_show_informative_status true
set __fish_git_prompt_color_upstream_ahead yellow
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_color_upstream_behind yellow
set __fish_git_prompt_char_upstream_behind '↓'



set __fish_git_prompt_color_untrackedfiles red
set __fish_git_prompt_char_untrackedfiles '*'

set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_char_dirtystate '±'

set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_char_stagedstate '⇈'

set __fish_git_prompt_showuntrackedfiles true
set __fish_git_prompt_color_cleanstate 777
set __fish_git_prompt_char_cleanstate '✔'



set _vbr_cyan    (set_color cyan)
set _vbr_yellow  (set_color yellow)
set _vbr_red     (set_color red)
set _vbr_blue    (set_color blue)
set _vbr_green   (set_color green)
set _vbr_gray    (set_color 777)



# goversion
function _go_prompt
	echo (go version | awk '{print $3}' | sed -e 's/^go//g')
end

function _is_go_dir
	echo (ls | grep .go ^/dev/null)
end



# goversion
function _ruby_prompt
	echo (rbenv version | awk '{print $1}')
end

function _is_ruby_dir
	echo (ls | grep Gemfile ^/dev/null)
end



# [user@host] path langversion [branch [git status]] prompt
function fish_prompt
	set -l exit_code $status

	set -l prompt ''
	set -e prompt[1]

	# display username and hostname if logged in as root, in sudo or ssh session
	if [ \( (id -u) -eq 0 -o $SUDO_USER \) -o $SSH_CONNECTION ]
		set -l host (hostname | cut -f 1 -d '.')
		set prompt $prompt $_vbr_yellow$USER$_vbr_gray'@'$_vbr_cyan$host
	end

	# path
	set prompt $prompt $_vbr_gray(pwd | sed "s:^$HOME:~:")

	# Go
	if [ (_is_go_dir) ]
		set prompt $prompt $_vbr_green'go(v'(_go_prompt)')'
	end

	# Ruby
	if [ (_is_ruby_dir) ]
		set prompt $prompt $_vbr_green'ruby(v'(_go_prompt)')'
	end

	# Git
	set prompt $prompt (__fish_git_prompt '%s')

	# prompt symbol
	if [ $exit_code != 0 ]; set prompt $prompt $_vbr_red'♦'
	else;                   set prompt $prompt $_vbr_green'♦'
	end

	echo -n $prompt (set_color normal)
end
