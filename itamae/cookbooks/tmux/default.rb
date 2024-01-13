include_recipe '../dotfiles/default.rb'

dotfiles '.config/tmux'

git "#{ENV["HOME"]}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
end

execute "#{ENV["HOME"]}/.tmux/plugins/tpm/bin/install_plugins"
