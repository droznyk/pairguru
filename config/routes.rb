Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    resources :comments, only: [:index, :new, :create]
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
  get '/top_commentators', to: 'comments#index'
end
