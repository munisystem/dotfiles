include_recipe '../dotfiles/default.rb'

execute 'Install fisherman' do
  command <<-EOL
  fish -c 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher'
  EOL
end

link File.join(ENV['HOME'], '.config', 'fish', 'fishfile') do
  to File.expand_path('../../../../config/fish/fishfile', __FILE__)
end

execute 'Install plugin' do
  command <<-EOL
  fish -c 'fisher'
  EOL
end
