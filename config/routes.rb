Rails.application.routes.draw do

  resource :danes
  resource :users

  root 'tweets#index'
end
