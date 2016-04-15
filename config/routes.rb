Rails.application.routes.draw do

  resources :danes
  resources :viveks

  root 'viveks#index'
end
