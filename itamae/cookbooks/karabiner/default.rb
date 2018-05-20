include_recipe '../dotfiles/default.rb'

link File.join(ENV['HOME'], '.config', 'karabiner') do
  to File.expand_path('../../../../config/karabiner', __FILE__)
end
