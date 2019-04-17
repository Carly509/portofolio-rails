Rails.application.routes.draw do
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "homepage#home"
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :sessions, only: [:new, :create, :destroy]
    get 'signup',to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    
    resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
    resources :relationships, only: [:create, :destroy]
  end
    
  end
