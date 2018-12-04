Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :charities do
    resources :missions, only: [:new, :create]
  end

  resources :missions, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get 'partnerships', to: 'missions#partnerships'
    end

    resources :partnerships, only: [:new, :create]
  end

  resources :businesses

  resources :partnerships, only: [:index, :show, :edit, :update, :destroy]

  get 'feed', to: 'pages#index', as: :feed
end
