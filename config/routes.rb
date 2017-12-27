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

  get '*path', to: 'pages#index'
  root to: 'pages#index'
end
