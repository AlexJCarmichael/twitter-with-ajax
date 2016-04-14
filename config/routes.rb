Rails.application.routes.draw do

  resource :danes
  resource :viveks

  root 'vivekss#index'
end
