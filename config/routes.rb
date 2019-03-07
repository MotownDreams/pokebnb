Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :photos, only: [:new, :create, :update, :edit, :destroy]
  end
  resources :users, only: [:show, :new, :create] do
    resources :bookings, only: [:index, :show]
  end
  resources :bookings, only: [:create]
end
