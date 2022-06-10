Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  match '/contacts',     to: 'contacts#new', via: 'get'
  match '/contacts/success',     to: 'contacts#success', via: 'get'
  resources "contacts", only: [:new, :create, :success]

  root "home_pages#index"

  resources :home_pages

  resources :gigs

  resources :workers

  resources :user_pages
  
end
