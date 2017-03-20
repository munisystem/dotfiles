include_recipe '../dotfiles/default.rb'

link File.join(ENV['HOME'], '.config', 'nvim') do
  to File.expand_path('../../../../config/nvim', __FILE__)
end
