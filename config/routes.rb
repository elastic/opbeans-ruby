Rails.application.routes.draw do
  namespace :api do
    resources :stats, only: %i[index]
    resources :products, only: %i[index show] do
      collection { get :top }
      resources :customers, only: %i[index]
    end
    resources :types, only: %i[index show]
    resources :customers, only: %i[index show]
    resources :orders, only: %i[index create show]
  end

  get '/is-it-coffee-time', to: 'coffee#coffee_time'
  get '/log-error', to: 'errors#log'
  get '/log-message', to: 'errors#message'
  get '/throw-error', to: 'errors#throw_error'

  get '/rum-config.js', to: 'application#rum_config'

  get '*path', to: 'application#index', format: 'html'
  root to: 'application#index'
end
