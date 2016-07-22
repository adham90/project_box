Rails.application.routes.draw do
  constraints subdomain: 'api', defaults: { format: 'json' } do
    post 'authenticate', to: 'authentication#authenticate'
    namespace :v1 do
      resources :applications
      resources :users
    end
  end
end
