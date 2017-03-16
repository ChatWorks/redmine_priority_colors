require 'redmine'
require_dependency 'css_inserter_hooks'

Redmine::Plugin.register :redmine_priority_colors do
  name 'Priority Colors'
  author 'Onur Güzel'
  description 'Customize the Issues table display by priority value. Only administrators can update the settings, other users can only view the current settings.'
  
  version '0.2'
  url 'https://github.com/Artistanbulpr/redmine_priority_colors'
  author_url 'https://www.artistanbul.io'

  settings :default => {
    'admin_label' => 'Priority Colors'
  }

  menu :admin_menu, :redmine_priority_colors, '/priority-colors/settings', :caption => :default['admin_label'], :last => true
end
