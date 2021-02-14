Rails.application.routes.draw do
  get '/profile', to: 'homes#profile'
  get 'index', to: 'homes#index'
  root to: 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
