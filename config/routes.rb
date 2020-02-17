Rails.application.routes.draw do
  
  root 'gossips#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :gossips do
    resources :comments
  end

  resources :cities, only: [:index, :show]
    
  get 'welcomes/:first_name', to: 'welcomes#index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
