Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "home_pages#index"

  resources :workers

  resources :home_pages

  resources :gigs

  resources :user_pages

  #get 'edit_user', action: :editUser, controller: :user_pages
  #get 'update_user', action: :updateUser, controller: :user_pages
  #get 'search_user', action: :searchUser, controller: :user_pages
end
