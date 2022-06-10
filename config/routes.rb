Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  match '/contacts',     to: 'contacts#new', via: 'get'
  match '/contacts/success',     to: 'contacts#success', via: 'get'
  resources "contacts", only: [:new, :create, :success]

  root "gigs#index";

  resources :gigs
  
  resources :cmc, only: [:index] do
  end
  
end
