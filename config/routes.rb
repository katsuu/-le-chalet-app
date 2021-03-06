Rails.application.routes.draw do
  devise_for :users
  root to: 'chalets#home'
  resources :chalets do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  patch 'bookings/:id/decline', to: 'bookings#decline', as: :decline
  patch 'bookings/:id/approve', to: 'bookings#approve', as: :approve
end
