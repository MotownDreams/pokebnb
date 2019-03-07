Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :photos, only: [:new, :create]
  end
  resources :users, only: [:show, :new, :create]
  resources :bookings, only: [:index, :show, :create, :create]
  resources :photos, only: [:destroy]
end
