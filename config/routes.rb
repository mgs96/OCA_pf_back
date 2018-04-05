Rails.application.routes.draw do
  require "devise_token_auth"
  
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'google_auth', to: 'google_login#google_auth'
      get 'apoyos/scrape'
      get 'apoyos/index'
    end
  end
  
end
