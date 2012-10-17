require_dependency 'redmine_browserid/view_hook_listener'

Redmine::Plugin.register :redmine_browserid do
  name 'Redmine Mozilla Persona/BrowserID plugin'
  author 'Martins Polakovs'
  description 'This plugin adds Mozilla Persona/BrowserID authentication to redmine'
  version '0.1'
  url 'https://github.com/martinsp/redmine_browserid'
  author_url 'https://github.com/martinsp'
end
