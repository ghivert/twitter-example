Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get    '/sign_in',    to: 'sessions#sign_in_form'
  post   '/sign_in',    to: 'sessions#sign_in'
  delete '/sign_out',   to: 'sessions#sign_out'

  get    '/tweets',     to: 'tweets#index'
  get    '/tweets/new', to: 'tweets#new', as: 'new_tweet'
  post   '/tweets',     to: 'tweets#create'
  get    '/tweets/:id', to: 'tweets#show', as: 'tweet'
  get    '/tweets/:id/edit', to: 'tweets#edit', as: 'edit_tweet'
  patch  '/tweets/:id', to: 'tweets#update'
  delete '/tweets/:id', to: 'tweets#delete', as: 'delete_tweet'
end
