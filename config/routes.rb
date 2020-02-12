Rails.application.routes.draw do
  root 'gossips#index'

  get 'users/:id', to: 'users#show', as: 'user'
  get 'gossips/:id', to: 'gossips#show', as: 'gossip'
  get 'welcomes/:first_name', to: 'welcomes#index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
