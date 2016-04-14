Rails.application.routes.draw do

  resource :danes
  resource :viveks

  root 'viveks#index'
end
