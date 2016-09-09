DOTFILES += config/.vim

include lib/utils/*.mk

.PHONY: update
update:
	git pull origin master
