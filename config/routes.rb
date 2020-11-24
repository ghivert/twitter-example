Rails.application.routes.draw do
  resources :users
  get '/users', to: 'users#all'
  get '/users/:id', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get    '/sign_in',  to: 'sessions#sign_in_form'
  post   '/sign_in',  to: 'sessions#sign_in'
  delete '/sign_out', to: 'sessions#sign_out'
end
