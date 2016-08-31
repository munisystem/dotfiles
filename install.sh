#!/bin/sh

set -e
set -u

setup(){
    dotfiles=$HOME/dotfiles

    has(){
        type "$1" > /dev/null 2>&1
    }

    symlink(){
    	ln -sf "$1" "$2"
    }

    # if [ ! -d "$HOME/.oh-my-zsh" ]; then
    #   curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    # fi

    if [ ! -d "$HOME/.config/fish/functions/" ]; then
      fish -c 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher'
    fi

    if [ -d "$dotfiles" ]; then
        echo "skip install remote dotfiles."
        # (cd "$dotfiles" && git pull --rebase)
    else
        git clone git@github.com:munisystem/dotfiles "$dotfiles"
    fi

    symlink "$dotfiles/.vimperatorrc" "$HOME/.vimperatorrc"
    rm -r "$HOME/.vimperator"
    symlink "$dotfiles/.vimperator" "$HOME/.vimperator"
    if [ ! -d "$HOME/.vimperator/plugin/vimppm" ]; then
      (mkdir "$HOME/.vimperator/plugin" && cd "$HOME/.vimperator/plugin" && git clone https://github.com/cd01/vimppm)
    fi

    symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
    symlink "$dotfiles/.gitignore_local" "$HOME/.gitignore"

    if has zsh; then
        symlink "$dotfiles/.zsh" "$HOME/.zsh"
        symlink "$dotfiles/.zsh/.zshenv" "$HOME/.zshenv"
    fi

    if has fish; then
        symlink "$dotfiles/fish/fishfile"  "$HOME/.config/fish/fishfile"
        fish -c 'fisher'
        symlink "$dotfiles/fish/config.fish"  "$HOME/.config/fish/config.fish"
        symlink "$dotfiles/fish/functions/fish_prompt.fish"  "$HOME/.config/fish/functions/fish_prompt.fish"
        symlink "$dotfiles/fish/functions/fish_title.fish"  "$HOME/.config/fish/functions/fish_title.fish"
    fi

    if has vim; then
        symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
        rm -r "$HOME/.vim"
        symlink "$dotfiles/.vim" "$HOME/.vim"
    fi
    
    if has tmux; then
      symlink "$dotfiles/.tmux.conf" "$HOME/.tmux.conf"
    fi

}

setup
