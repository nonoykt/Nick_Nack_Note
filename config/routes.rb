Rails.application.routes.draw do

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

  resources :users, only: %i[index show]
  resources :microposts, only: %i[index timeline show edit]
  get 'timeline', to:'microposts#timeline'

  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/help', to: 'pages#help'
  get '/privacy', to: 'pages#privacy'
  get '/terms_of_service', to: 'pages#terms_of_service'
end
