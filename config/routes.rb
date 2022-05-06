Rails.application.routes.draw do
  root "gigs#index"

  resources :gigs
end
