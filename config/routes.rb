Rails.application.routes.draw do
  root 'microposts#index'
  get 'home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/help', to: 'pages#help'
  get '/privacy', to: 'pages#privacy'
  get '/terms_of_service', to: 'pages#terms_of_service'
  get 'timeline', to:'microposts#timeline'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    session: 'users/sessions',
    unlocks: 'users/unlocks',
    password: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest'
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  get '/user/:id/follows_posts', to: 'microposts#timeline', as: :user_timeline
  post 'likes/:micropost_id/create', to: 'likes#create', constraints: { micropost_id: /\d+/ }, as: :likes_create
  post 'likes/:micropost_id/delete', to: 'likes#destroy', constraints: { micropost_id: /\d+/ }, as: :likes_delete

  resources :users, only: %i[index show] do
    member do
      get :following, :followers
    end
    collection do
      get :likes
    end
  end
  resources :microposts, only: %i[index show new edit create destroy]
  resources :relationships, only: %i[create destroy]

end
