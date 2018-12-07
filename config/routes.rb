Rails.application.routes.draw do

  get 'applications/after_sign_in_path_for'
  get 'membership/create'
  devise_for :users, :controllers => { :registrations => :registrations }
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

  post 'charities/:id/follow', to: 'charities#follow', as: :follow

  delete 'charities/:id/follow', to: 'charities#unfollow', as: :unfollow
end
