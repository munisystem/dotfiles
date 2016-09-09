.PHONY: dotfiles
dotfiles:
	@$(foreach val, $(DOTFILES), ln -sf $(abspath $(val)) $(HOME)/$(val);)
