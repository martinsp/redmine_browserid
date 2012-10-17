# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match 'browserid/login' => 'browserid#login', :as => :login, :via => :post