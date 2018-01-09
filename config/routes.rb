Rails.application.routes.draw do
  resources :models
  resources :pieces
  resources :suburbs
  resources :divisions
  resources :types
  root to: 'pieces#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
