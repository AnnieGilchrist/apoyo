Rails.application.routes.draw do

  get 'applications/after_sign_in_path_for'
  get 'membership/create'
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'pages#home'

  resources :charities do
    resources :missions, only: [:new, :create, :edit, :update]
  end

  resources :missions, only: [:index, :show, :destroy] do
    member do
      get 'partnerships', to: 'missions#partnerships'
    end

    resources :partnerships, only: [:new, :create]
  end

  resources :businesses

  resources :partnerships, only: [:index, :show, :edit, :update, :destroy] do
     resources :messages, only: :create
  end

  get 'feed', to: 'pages#index', as: :feed

  post 'charities/:id/follow', to: 'charities#follow', as: :follow_charity

  delete 'charities/:id/follow', to: 'charities#unfollow', as: :unfollow_charity

  post 'businesses/:id/follow', to: 'businesses#follow', as: :follow_business

  delete 'businesses/:id/follow', to: 'businesses#unfollow', as: :unfollow_business
end
