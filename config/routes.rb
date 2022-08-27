Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    resources :questions,  only: [:index, :show]

    root "questions#index"

    resource :session, only: [:new, :create, :destroy]

    resources :users, only: [:show, :new, :create] do 
      get :activate, on: :collection
    end

    resources :rankings, only: [:index, :create, :destroy, :edit, :update, :show]

    resources :suggestions, only: [:new, :create]

    get '/rankings/new/:id', to: 'rankings#new', as: 'new_ranking'

    get '/recentrankings', to: 'rankings#recent', as: 'recent_rankings'
    


end
