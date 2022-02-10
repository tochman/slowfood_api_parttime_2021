Rails.application.routes.draw do
  namespace :api do
    
      resources :products, only: [:index], constraints: { format: 'json' }
    
  end
end