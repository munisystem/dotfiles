include_recipe '../dotfiles/default.rb'

git "#{ENV["HOME"]}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
end

execute "#{ENV["HOME"]}/.tmux/plugins/tpm/bin/install_plugins" do
  subscribes :run, "link[#{ENV['HOME']}/.tmux.conf]"
  action :nothing
end

dotfiles '.config/tmux'
